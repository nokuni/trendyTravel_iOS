//
//  Destinations.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 26/06/2023.
//

import Foundation

// MARK: - Destination
struct Destination: Codable, Hashable, Identifiable {
    var id: Int
    var country: String
    var city: String
    var imageName: String
    var latitude: Double
    var longitude: Double
}

extension Destination {
    static let example = Destination(id: 0,
                                     country: "France",
                                     city: "Paris",
                                     imageName: "",
                                     latitude: 0,
                                     longitude: 0)
}
