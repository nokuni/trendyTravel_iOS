//
//  AllRestaurantListView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 18/07/2023.
//

import SwiftUI
import Utility_Toolbox

struct AllRestaurantListView: View {
    @EnvironmentObject var activityVM: ActivityViewModel
    @State var searchText = ""
    var body: some View {
        ScrollView {
            VStack {
                ForEach(searchedRestaurants) { restaurant in
                    NavigationLink {
                        RestaurantDetailsView(activity: restaurant, reviews: [])
                    } label: {
                        restaurantItem(restaurant: restaurant)
                    }
                }
            }
        }
        .navigationTitle(L10n.restaurants)
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchText, prompt: L10n.restaurants)
    }
    
    var searchedRestaurants: [Activity] {
        if searchText.isEmpty {
            return activityVM.particularActivities(category: .restaurant)
        } else {
            return activityVM.particularActivities(category: .restaurant).filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    @ViewBuilder
    private func restaurantItem(restaurant: Activity) -> some View {
        VStack(alignment: .leading) {
            Text(restaurant.name.capitalized)
                .font(.system(.title2, design: .default, weight: .bold))
                .foregroundColor(.primary)
            ImageURLView(image: restaurant.imageName)
                .cornerRadius(5)
                .frame(maxWidth: .infinity, maxHeight: CGSize.screen.height * 0.3)
        }
        .padding()
    }
}

struct AllRestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        AllRestaurantListView()
    }
}
