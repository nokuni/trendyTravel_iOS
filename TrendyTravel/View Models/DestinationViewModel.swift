//
//  DestinationViewModel.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI
import Utility_Toolbox

class DestinationViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var destinations: [Destination] = [
        .init(id: 1, country: "France", city: "Paris", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235)
    ]
}
