//
//  Posts.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 29/06/2023.
//

import Foundation

// MARK: - Post
struct Post: Codable, Hashable {
    var id: UUID
    var title: String
    var imageName: String
    var hashtags: [String]
    var userID: UUID

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case imageName
        case hashtags
        case userID = "userId"
    }
}

