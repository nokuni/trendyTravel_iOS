//
//  UserViewModel.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 26/06/2023.
//

import SwiftUI
import Utility_Toolbox

class UserViewModel: ObservableObject {
    @Published var loggedUser: User?
    @Published var users: [User] = []
    @AppStorage("userID") var userID: Int?
    
    var isUserConnected: Bool { userID != nil }
        
    private func getUsers() async throws -> [User] {
        let url = AppConfiguration.routes.userBaseURL
        
        do {
            return try await AppConfiguration.routes.manager.get(url: url)
        } catch {
            throw error.localizedDescription
        }
    }
    
    private func getUser(email: String, password: String) async throws -> User? {
        let url = AppConfiguration.routes.userBaseURL
        guard let userID = userID else { return nil }
        do {
            return try await AppConfiguration.routes.manager.get(url: url, id: userID)
        } catch {
            throw error.localizedDescription
        }
    }
    
    func postUser(user: User) async throws {
        let url = AppConfiguration.routes.userBaseURL
        
        do {
            let newUser = User(firstName: user.firstName, lastName: user.lastName, description: user.description, profileImage: user.profileImage, username: user.username, email: user.email, password: user.password)
            _ = try await AppConfiguration.routes.manager.post(url: url, value: newUser)
        } catch {
            throw error.localizedDescription
        }
    }
    
    func putUser(userID: Int, user:User) async throws {
        let url = AppConfiguration.routes.userBaseURL
        
        do {
            let putUser = User(firstName: user.firstName, lastName: user.lastName, description: user.description, profileImage: user.profileImage, username: user.username, email: user.email, password: user.password)
            _ = try await AppConfiguration.routes.manager.put(url: "\(url)/\(userID)", value: putUser)
            self.loggedUser = putUser
        } catch {
            throw error.localizedDescription
        }
    }
    
    func fetchUsers() {
        DispatchQueue.main.async {
            AsyncManager.loadContent { [weak self] in
                guard let self else { return }
                self.users = try await self.getUsers()
            }
        }
    }
    
    func signIn(email: String, password: String) {
        DispatchQueue.main.async {
            AsyncManager.loadContent { [weak self] in
                guard let self else { return }
                self.loggedUser = try await self.getUser(email: email, password: password)
            }
        }
    }
    
    func signUp(user: User) {
        DispatchQueue.main.async {
            AsyncManager.loadContent { [weak self] in
                guard let self else { return }
                try await self.postUser(user: user)
            }
        }
    }
}
