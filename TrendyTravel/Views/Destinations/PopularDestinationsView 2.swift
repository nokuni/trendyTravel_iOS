//
//  PopularDestinationsView.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 26/06/2023.
//

import SwiftUI

struct PopularDestinationsView: View {
    @EnvironmentObject var destinationVM: DestinationViewModel
    var body: some View {
        VStack {
            HStack {
                Text("Popular Destinations")
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                seeAllButton()
            }
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    DestinationListView(destinations: destinationVM.destinations)
                }
                .padding(.horizontal)
            }
        }
    }
    
    @ViewBuilder
    private func seeAllButton() -> some View {
        NavigationLink {
            AllDestinationsListView()
        } label: {
            Text("See all")
                .font(.system(size: 12, weight: .semibold))
        }
    }
}

struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PopularDestinationsDetailsView(destination: .init(id: 1, country: "France", city: "Paris", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235))
        }
    }
}
