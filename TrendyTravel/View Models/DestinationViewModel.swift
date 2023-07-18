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
    
    var destination: Destination?
    
    init() {
        fetchDestinations()
    }
    
    private let url = AppConfiguration.routes.destinationsBaseURL
    
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
    
    func destination(id: Int) {
        DispatchQueue.main.async {
            AsyncManager.loadContent { [weak self] in
                guard let self else { return }
                self.destination = try await self.getDestination(id: id)
            }
        }
    }
}
