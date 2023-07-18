//
//  Activity.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 18/07/2023.
//

import Foundation

// MARK: - Activity
struct Activity: Codable, Hashable {
    var id: Int
    var name: String
    var imageName: String
    var category: Category
    var link: String
    var price: String
    var latitude: Double
    var longitude: Double
    var description: String
    var rating: Int
    var destinationId: Int
    
    enum Category: String, CaseIterable, Codable {
        case bar
        case spectacle
        case sport
        case restaurant
        case culture
        
        var image: String {
            switch self {
            case .bar: return "wineglass.fill"
            case .spectacle: return "music.mic"
            case .sport: return "sportscourt.fill"
            case .restaurant: return "fork.knife"
            case .culture: return "books.vertical.fill"
            }
        }
    }

    enum CodingKeys: String, CodingKey {
        case id
        case category
        case name
        case imageName
        case link
        case price
        case latitude
        case longitude
        case description
        case rating
        case destinationId
    }
}

extension Activity {
    static let example = Activity(id: 0, name: "", imageName: "", category: .restaurant, link: "", price: "", latitude: 0.0, longitude: 0.0, description: "", rating: 3, destinationId: 0)
}
