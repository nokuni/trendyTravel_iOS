//
//  Follower.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 18/07/2023.
//

import Foundation

struct Follower: Codable {
    var id: Int
    var followerID: Int
    var followedID: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case followerID = "followerId"
        case followedID = "followedId"

    }
}
