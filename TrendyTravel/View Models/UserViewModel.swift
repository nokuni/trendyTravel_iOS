//
//  UserViewModel.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 26/06/2023.
//

import SwiftUI
import Utility_Toolbox

class UserViewModel: ObservableObject {
    @Published var user: User?
    @Published var users: [User] = []
    @Published var posts: [Post] = []
    @AppStorage("userID") var userID: Int?
    
    var isUserConnected: Bool { userID != nil }
    
    init() {
        fetchUsers()
        fetchPosts()
    }
    
    private let userURL = AppConfiguration.routes.userBaseURL
    private let postsURL = AppConfiguration.routes.postsBaseURL
    
    private func getUsers() async throws -> [User] {
        do {
            return try await AppConfiguration.routes.manager.get(url: userURL)
        } catch {
            throw error.localizedDescription
        }
    }
    
    private func getAllPosts() async throws -> [Post] {
        do {
            return try await AppConfiguration.routes.manager.get(url: postsURL)
        } catch {
            throw error.localizedDescription
        }
    }
    
    private func getUser(id: Int) async throws -> User? {
        do {
            return try await AppConfiguration.routes.manager.get(url: userURL, id: id)
        } catch {
            throw error.localizedDescription
        }
    }
    
    private func getUser(email: String, password: String) async throws -> User? {
        guard let userID = userID else { return nil }
        do {
            return try await AppConfiguration.routes.manager.get(url: userURL, id: userID)
        } catch {
            throw error.localizedDescription
        }
    }
    
    private func postUser(user: User) async throws {
        do {
            let newUser = User(firstName: user.firstName, lastName: user.lastName, description: user.description, profileImage: user.profileImage, username: user.username, email: user.email, password: user.password)
            _ = try await AppConfiguration.routes.manager.post(url: userURL, value: newUser)
        } catch {
            throw error.localizedDescription
        }
    }
    
    /// Get all users
    func fetchUsers() {
        DispatchQueue.main.async {
            AsyncManager.loadContent { [weak self] in
                guard let self else { return }
                self.users = try await self.getUsers()
            }
        }
    }
    
    /// Get all posts
    func fetchPosts() {
        DispatchQueue.main.async {
            AsyncManager.loadContent { [weak self] in
                guard let self else { return }
                self.posts = try await self.getAllPosts()
            }
        }
    }
    
    func userFromReview(_ review: Review) -> User? {
        let user = users.first(where: { $0.id == review.userID })
        return user
    }
    
    func signUser(id: Int) {
        DispatchQueue.main.async {
            AsyncManager.loadContent { [weak self] in
                guard let self else { return }
                self.user = try await self.getUser(id: id)
            }
        }
    }
    
    /// Get 1 user
    func signIn(email: String, password: String) {
        DispatchQueue.main.async {
            AsyncManager.loadContent { [weak self] in
                guard let self else { return }
                self.user = try await self.getUser(email: email, password: password)
            }
        }
    }
    
    /// Register 1 user
    func signUp(user: User) {
        DispatchQueue.main.async {
            AsyncManager.loadContent { [weak self] in
                guard let self else { return }
                try await self.postUser(user: user)
            }
        }
    }
    
    func userLikes(user: User) -> Int {
        let userPosts = posts.filter { $0.userID == user.id }
        let likes = Array(userPosts.map { $0.likes }.joined())
        return likes.count
    }
    
    func userPosts(user: User) -> [Post] {
        posts.filter { $0.userID == user.id }
    }
    
    func userFollowing(user: User) -> Int {
        let otherUsers = users.filter { $0.id != user.id }
        let followers = Array(otherUsers.map { $0.followers }.joined())
        let following = followers.filter { $0.followerID == user.id }.count
        return following
    }
}
