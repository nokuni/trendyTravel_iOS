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
    @Published var reviews: [Review] = []
    
    private let activitiesURL = AppConfiguration.routes.activitiesBaseURL
    private let reviewsURL = AppConfiguration.routes.activitiesBaseURL
    
    init () {
        fetchActivities()
    }
    
    private func getActivities() async throws -> [Activity] {
        do {
            return try await AppConfiguration.routes.manager.get(url: activitiesURL)
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    private func getActivity(id: Int) async throws -> Activity? {
        do {
            return try await AppConfiguration.routes.manager.get(url: activitiesURL, id: id)
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    private func getReviews() async throws -> [Review] {
        do {
            return try await AppConfiguration.routes.manager.get(url: reviewsURL)
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
    
    func fetchActivities() {
        DispatchQueue.main.async {
            AsyncManager.loadContent { [weak self] in
                guard let self else { return }
                self.activities = try await self.getActivities()
            }
        }
    }
    
    func fetchReviews() {
        DispatchQueue.main.async {
            AsyncManager.loadContent { [weak self] in
                guard let self else { return }
                self.reviews = try await self.getReviews()
            }
        }
    }
    
    func activityReviews(_ activity: Activity) -> [Review] {
        reviews.filter { $0.activityID == activity.id }
    }
    
    func particularActivities(category: Activity.Category) -> [Activity] {
        activities.filter { $0.category == category }
    }
}
