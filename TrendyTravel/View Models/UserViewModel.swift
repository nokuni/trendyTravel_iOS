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
    @Published var posts: [Post] = []
    @Published var isLoading = false
    @AppStorage("userID") var userID: Int?
    
    var isUserConnected: Bool { loggedUser != nil }
    
    init() {
        fetchUsers()
        fetchPosts()
        signInOnLaunch()
    }
    
    private let userURL = AppConfiguration.routes.userBaseURL
    private let postsURL = AppConfiguration.routes.postsBaseURL
    private let imageURL = AppConfiguration.routes.imageURL
    
    private func getUsers() async throws -> [User] {
        do {
            return try await AppConfiguration.routes.manager.get(url: userURL, keyDecodingStrategy: .convertFromSnakeCase)
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
            return try await AppConfiguration.routes.manager.get(url: userURL, id: id, keyDecodingStrategy: .convertFromSnakeCase)
        } catch {
            throw error.localizedDescription
        }
    }
    
    private func signInUser(user: User) async {
        DispatchQueue.main.async {
            self.loggedUser = user
            self.userID = user.id
        }
    }
    
    private func postUser(firstName: String,
                          lastName: String,
                          description: String,
                          image: UIImage,
                          username: String,
                          email: String,
                          password: String) async throws -> User {
        do {
            let imageURL = try await AppConfiguration.routes.manager.uploadImage(
                url: imageURL,
                parameters: ["\(username)PP": "\(username)ID"],
                image: image
            )
            let nextID = users.count + 1
            let newUser = User(id: nextID,
                               firstName: firstName,
                               lastName: lastName,
                               description: description,
                               profileImage: imageURL ?? username,
                               username: username,
                               email: email,
                               password: password)
            let postedUser = try await AppConfiguration.routes.manager.postRequest(url: userURL, value: newUser, keyDecodingStrategy: .convertFromSnakeCase)
            return postedUser
        } catch {
            throw error.localizedDescription
        }
    }
    
    private func removeUser(id: Int) async throws {
        do {
            let _: User = try await AppConfiguration.routes.manager.delete(url: userURL, id: id)
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
                self.loggedUser = try await self.getUser(id: id)
            }
        }
    }
    
    func signInOnLaunch() {
        guard let userID = userID else { return }
        DispatchQueue.main.async {
            AsyncManager.loadContent { [weak self] in
                guard let self else { return }
                self.loggedUser = try await self.getUser(id: userID)
            }
        }
    }
    
    /// Get 1 user
    func signIn(email: String, password: String) {
        if let firstUser = users.first(where: {
            $0.email == email && $0.password == $0.password
        }) {
            loggedUser = firstUser
            userID = firstUser.id
        }
    }
    
    /// Register 1 user
    func signUp(firstName: String,
                lastName: String,
                description: String,
                image: UIImage,
                username: String,
                email: String,
                password: String) {
        DispatchQueue.main.async {
            AsyncManager.loadContent { [weak self] in
                guard let self else { return }
                let postedUser = try await self.postUser(firstName: firstName, lastName: lastName, description: description, image: image, username: username, email: email, password: password)
                self.loggedUser = postedUser
                self.userID = postedUser.id
                self.isLoading = false
            }
        }
    }
    
    func deleteUser(id: Int) {
        DispatchQueue.main.async {
            AsyncManager.loadContent { [weak self] in
                guard let self else { return }
                try await self.removeUser(id: id)
            }
        }
    }
    
    func userLikes(user: User) -> Int {
        let userPosts = posts.filter { $0.userID == user.id }
        let likes = Array(userPosts.compactMap { $0.likes }.joined())
        return likes.count
    }
    
    func userPosts(user: User) -> [Post] {
        posts.filter { $0.userID == user.id }
    }
    
    func userFollowing(user: User) -> Int {
        let otherUsers = users.filter { $0.id != user.id }
        let followers = Array(otherUsers.compactMap { $0.followers }.joined())
        let following = followers.filter { $0.followerID == user.id }.count
        return following
    }
}
