//
//  Users.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 26/06/2023.
//

import Foundation

// MARK: - User
struct User: Codable, Identifiable {
    var id = UUID()
    var firstName: String?
    var lastName: String?
    var description: String?
    var profileImage: String?
    var username: String?
    var email: String?
    var password: String?
    var posts: [Post] = []

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case description
        case profileImage = "profilImage"
        case username = "pseudo"
        case password
        case email
        case posts = "Posts"

    }
}

extension User {
    static let example =
    User(firstName: "john",
         lastName: "doe",
         description: "hello I'm new",
         profileImage: "billy",
         username: "jo.D",
         email: "jo.d@gmail.com",
         password: "kkk",
         posts: [
            Post(id: UUID(),
                 title: "1st post",
                 imageName: "eiffel_tower",
                 hashtags: ["paradise", "lost"],
                 userID: UUID())
         ]
    )
}
