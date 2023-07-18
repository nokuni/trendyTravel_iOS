//
//  PopularDestinationTile.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI

struct PopularDestinationTile: View {
    let destination: Destination
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            image()
            cityName()
            countryName()
        }
    }
    
    @ViewBuilder
    private func image() -> some View {
        ImageURLView(image: destination.imageName)
            .frame(width: 125, height: 125)
            .cornerRadius(4)
            .padding(.all, 6)
    }
    
    @ViewBuilder
    private func cityName() -> some View {
        Text(destination.city.capitalized)
            .font(.system(size: 12, weight: .semibold))
            .padding(.horizontal, 12)
            .foregroundColor(Color(.label))
    }
    
    @ViewBuilder
    private func countryName() -> some View {
        Text(destination.country.capitalized)
            .font(.system(size: 12, weight: .semibold))
            .padding(.horizontal, 12)
            .padding(.bottom, 8)
            .foregroundColor(.gray)
    }
}

struct PopularDestinationTile_Previews: PreviewProvider {
    static var previews: some View {
        PopularDestinationTile(destination: Destination.example)
    }
}
