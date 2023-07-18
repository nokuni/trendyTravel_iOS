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
    @Published var destinations: [Destination] = []
    
    private let url = AppConfiguration.routes.destinationsBaseURL
    
    init() {
        fetchDestinations()
    }
    
    private func getDestinations() async throws -> [Destination] {
        do {
            return try await AppConfiguration.routes.manager.get(url: url)
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    func getDestination(id: Int) async throws -> Destination? {
        do {
            return try await AppConfiguration.routes.manager.get(url: url, id: id)
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func fetchDestinations() {
        DispatchQueue.main.async {
            AsyncManager.loadContent { [weak self] in
                guard let self else { return }
                self.destinations = try await self.getDestinations()
            }
        }
    }
    
    func destination(id: Int) -> Destination? {
        if let destination = destinations.first(where: { $0.id == id }) {
            return destination
        }
        return nil
    }
}
