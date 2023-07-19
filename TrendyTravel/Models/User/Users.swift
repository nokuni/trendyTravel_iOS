//
//  Users.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 26/06/2023.
//

import Foundation

// MARK: - User
struct User: Identifiable, Hashable, Codable {
    var id: Int?
    var firstName: String
    var lastName: String?
    var description: String?
    var profileImage: String?
    var username: String
    var email: String
    var password: String
    var posts: [Post] = []
    var followers: [Follower] = []

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
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
    User(id: 1,
         firstName: "Amy",
         lastName: "Example",
         description: "Bonjour je vis dans la demo",
         profileImage: "amy",
         username: "amy.D",
         email: "amy.d@gmail.com",
         password: "ok",
         posts: [
            Post(id: 1,
                 title: "Example post",
                 imageName: "eiffel_tower",
                 hashtags: ["hashtag", "example"],
                 userID: 1)
         ],
         followers: [
            Follower(id: 0, followerID: 0, followedID: 0)
         ]
    );

    static let errorIndicators =
    User(id: 0,
         firstName: "ERR_NameNotFound",
         lastName: "",
         description: "",
         profileImage: "",
         username: "ERR_UsernameNotFound",
         email: "ERR_EmailNotFound",
         password: "ERR_PasswordNotFound",
         posts: [
            Post(id: 1,
                 title: "ERR_PostTitleNotFOund",
                 imageName: "ERR_LocationImage",
                 hashtags: ["ERR_HashtagsNotFound"],
                 userID: 1)
         ],
         followers: [
            Follower(id: 0, followerID: 0, followedID: 0)
         ]
    )
}
