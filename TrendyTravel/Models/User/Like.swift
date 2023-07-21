//
//  Like.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 18/07/2023.
//

import Foundation

struct Like: Codable {
    var userID: Int
    var postID: Int
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case postID = "postId"
    }
}
