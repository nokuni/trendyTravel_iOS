//
//  RestaurantDetailsView.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 29/06/2023.
//

import SwiftUI


struct RestaurantDetailsView: View {
    @EnvironmentObject var destinationVM: DestinationViewModel
    var activity: Activity
    var reviews: [Review]
    var body: some View{
        ScrollView {
            ZStack(alignment: .bottomLeading) {
                imageHeader()
                imageGradientOverlay()
                nameAndRating()
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(L10n.locationAndDescription)
                    .font(.system(size: 16, weight: .bold))
                if let destination = destinationVM.destination(id: activity.id) {
                    Text("\(destination.city), \(destination.country)")
                }
                HStack {
                    ForEach(0..<5, id: \.self) { _ in
                        Image(systemName: "dollarsign.circle.fill")
                    }
                    .foregroundColor(.orange)
                }
                HStack { Spacer() }
            }
            .padding(.top)
            .padding(.horizontal)
            description()
            Divider()
                .padding(.horizontal)
            ReviewList(activity: activity)
                .padding(.top)
        }
        .navigationBarTitle(L10n.restaurantDetails, displayMode: .inline)
    }
    
    @ViewBuilder
    private func imageHeader() -> some View {
        ImageURLView(image: activity.imageName)
            .scaledToFill()
    }
    
    @ViewBuilder
    private func imageGradientOverlay() -> some View {
        LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
    }
    
    @ViewBuilder
    private func nameAndRating() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(activity.name)
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .bold))
                StarRatingView(rating: activity.rating)
            }
            Spacer()
        }
        .padding()
    }
    
    @ViewBuilder
    private func description() -> some View {
        Text(activity.description)
            .padding(.top, 8)
            .font(.system(size: 14, weight: .regular))
            .padding(.horizontal)
            .padding(.bottom)
    }
    
    @ViewBuilder
    private func function() -> some View {
        
    }
}

struct RestaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantDetailsView(activity: Activity.example, reviews: [])
        }
    }
}
