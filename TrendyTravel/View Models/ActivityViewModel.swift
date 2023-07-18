//
//  ActivityViewModel.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import Foundation
import Utility_Toolbox

class ActivityViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var activities: [Activity] = []
    
    init () {
        fetchActivities()
    }
    
    func getActivities() async throws -> [Activity] {
        let url = AppConfiguration.routes.activitiesBaseURL
        do {
            return try await AppConfiguration.routes.manager.get(url: url)
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    func getActivity(id: Int) async throws -> Activity? {
        let url = AppConfiguration.routes.activitiesBaseURL
        do {
            return try await AppConfiguration.routes.manager.get(url: url, id: id)
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    func fetchActivities() {
        DispatchQueue.main.async {
            AsyncManager.loadContent { [weak self] in
                guard let self else { return }
                self.activities = try await self.getActivities()
            }
        }
    }
    
    func particularActivities(category: Activity.Category) -> [Activity] {
        activities.filter { $0.category == category }
    }
}
