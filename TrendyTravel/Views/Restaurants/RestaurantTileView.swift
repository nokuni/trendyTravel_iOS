//
//  RestaurantTileView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 18/07/2023.
//

import SwiftUI

struct RestaurantTileView: View {
    @EnvironmentObject var destinationVM: DestinationViewModel
    var activity: Activity
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.white)
            .frame(minHeight: CGSize.screen.height * 0.1,
                   maxHeight: CGSize.screen.height * 0.1)
            .shadow(color: .silver, radius: 5)
            .overlay(itemContent())
    }
    
    @ViewBuilder
    private func image() -> some View {
        ImageURLView(image: activity.imageName)
            .frame(width: 70, height: 70)
            .cornerRadius(5)
    }
    
    @ViewBuilder
    private func itemContent() -> some View {
        HStack {
            image()
            VStack(alignment: .leading, spacing: 6) {
                Text(activity.name)
                    .multilineTextAlignment(.leading)
                HStack {
                    Image(systemName: "star.fill")
                    Text("\(activity.rating)")
                }
                if let destination = destinationVM.destination(id: activity.destinationId) {
                    Text("\(destination.country.capitalized), \(destination.city.capitalized)")
                }
            }
            .font(.system(size: 12, weight: .semibold))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
}
