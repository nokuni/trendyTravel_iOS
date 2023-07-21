//
//  Users.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 26/06/2023.
//

import Foundation

// MARK: - User
struct User: Codable, Identifiable {
    var id: Int
    var firstName: String
    var lastName: String
    var description: String
    var profileImage: String
    var username: String
    var email: String
    var password: String
    var posts: [Post]?
    var followers: [Follower]?

    enum CodingKeys: String, CodingKey {
        case id
        case firstName
        case lastName
        case description
        case profileImage = "profilImage"
        case username = "pseudo"
        case password
        case email
        case posts = "Posts"
        case followers = "Followers"
    }
}

extension User {
    static let example =
    User(id: 0,
         firstName: "john",
         lastName: "doe",
         description: "hello I'm new",
         profileImage: "billy",
         username: "jo.D",
         email: "jo.d@gmail.com",
         password: "kkk",
         posts: [],
         followers: [
            Follower(id: 0, followerID: 0, followedID: 0)
         ]
    )
}
