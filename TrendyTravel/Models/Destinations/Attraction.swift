//
//  Attraction.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import Foundation

struct Attraction: Identifiable {
    let id = UUID().uuidString
    let name: String
    let imageName: String
    let latitude: Double
    let longitude: Double
}

extension Attraction {
    static let example = Attraction(name: "eiffel tower",
                                    imageName: "eiffel_tower",
                                    latitude: 48.858605,
                                    longitude: 2.2946)
}
