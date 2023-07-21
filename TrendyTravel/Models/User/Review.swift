//
//  Review.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import Foundation

struct Review: Codable, Hashable {
    var id: Int
    var content: String
    var rating: Int
    var userID: Int
    var activityID: Int
    var createdAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case content
        case rating
        case userID = "userId"
        case activityID = "activityId"
        case createdAt
    }
}

extension Review {
    static let example = Review(id: 0, content: "", rating: 3, userID: 0, activityID: 0, createdAt: "")
}
