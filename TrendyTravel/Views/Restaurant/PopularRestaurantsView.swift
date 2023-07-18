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
                Text(L10n.PopularRestaurantsView.title)
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text(L10n.PopularRestaurantsView.see_all)
                    .font(.system(size: 12, weight: .semibold))
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
            Text(L10n.PopularRestaurantsView.see_all)
                .font(.system(size: 12, weight: .semibold))
        }

    }
    
    @ViewBuilder
    private func restaurantItem(restaurant: Activity) -> some View {
        NavigationLink {
            RestaurantDetailsView(activity: restaurant,
                                  reviews: [Review(id: 0, content: L10n.RestaurantDetailsView.content, rating: 5, userID: 0, activityID: 0)])
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
                ForEach(activityVM.activities, id: \.self) { restaurant in
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
