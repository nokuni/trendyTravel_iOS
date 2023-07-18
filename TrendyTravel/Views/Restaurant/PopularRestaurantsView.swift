//
//  PopularRestaurantsView.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 26/06/2023.
//

import SwiftUI

struct PopularRestaurantsView: View {
    @EnvironmentObject var activityVM: ActivityViewModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Popular Restaurants")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                seeAllButton()
            }
            .padding(.horizontal)
            .padding(.top)
            restaurantList()
        }
    }
    
    @ViewBuilder
    private func seeAllButton() -> some View {
        NavigationLink {
            AllRestaurantListView()
        } label: {
            Text("See all")
                .font(.system(size: 12, weight: .semibold))
        }
    }
    
    @ViewBuilder
    private func restaurantItem(restaurant: Activity) -> some View {
        NavigationLink {
            RestaurantDetailsView(activity: restaurant,
                                  reviews: [Review(id: 0, content: "Very good restaurant with typical Tokyo habitants and amazing food", rating: 5, userID: 0, activityID: 0)])
        } label: {
            RestaurantTileView(activity: restaurant)
                .foregroundColor(Color(.label))
        }
        .frame(width: 240)
        .padding(.bottom)
    }
    
    @ViewBuilder
    private func restaurantList() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(activityVM.particularActivities(category: .restaurant), id: \.self) { restaurant in
                    restaurantItem(restaurant: restaurant)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct PopularRestaurantsView_Previews: PreviewProvider {
    static var previews: some View {
        PopularRestaurantsView()
    }
}
