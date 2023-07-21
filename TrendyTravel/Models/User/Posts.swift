//
//  Posts.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 29/06/2023.
//

import Foundation

// MARK: - Post
struct Post: Codable, Identifiable {
    var id: Int
    var title: String
    var imageName: String
    var hashtags: [String]
    var userID: Int
    var likes: [Like]?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageName
        case hashtags
        case userID = "userId"
        case likes = "Likes"
    }
}
