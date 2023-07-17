//
//  CategoryDetailsViewModel.swift
//  TrendyTravel
//
//  Created by N N on 17/07/2023.
//

import Foundation
import SwiftUI

class CategoryDetailsViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var activities: [Activity] = []
    @Published var errorMessage = ""

    init() {
        fetchActivities()
    }

    func fetchActivities() {
        let urlString = "https://trendytravel.onrender.com/activities"
        guard let url = URL(string: urlString) else {
            self.isLoading = false
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                self.isLoading = false

                if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode >= 400 {
                    self.errorMessage = "Bad status: \(statusCode)"
                    return
                }

                guard let data = data else { return }
                do {
                    self.activities = try JSONDecoder().decode([Activity].self, from: data)
                } catch {
                    print("Failed to decode JSON: ", error)
                    self.errorMessage = error.localizedDescription
                }
            }
        }.resume()
    }
}
