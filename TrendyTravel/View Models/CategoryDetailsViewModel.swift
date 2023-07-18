//
//  CategoryDetailsViewModel.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 26/06/2023.
//

import SwiftUI
import Utility_Toolbox

class CategoryDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var activities: [Activity] = []
    @Published var errorMessage = ""
    
    private let url = AppConfiguration.routes.activitiesBaseURL
    
    init() {
        fetchActivities()
    }
    
    func getActivities() async throws -> [Activity] {
        do {
            return try await AppConfiguration.routes.manager.get(url: url)
        } catch {
            throw error.localizedDescription
        }
    }
    
    func fetchActivities() {
        DispatchQueue.main.async {
            AsyncManager.loadContent { [weak self] in
                guard let self else { return }
                self.activities = try await self.getActivities()
            }
        }
    }
}
