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
            topContent()
            destinationList()
        }
    }
    
    @ViewBuilder
    private func topContent() -> some View {
        HStack {
            title()
            Spacer()
            seeAllButton()
        }
        .padding(.horizontal)
        .padding(.top)
    }
    
    @ViewBuilder
    private func title() -> some View {
        Text(L10n.popularDestinations)
            .font(.system(size: 14, weight: .semibold))
    }
    
    @ViewBuilder
    private func seeAllButton() -> some View {
        NavigationLink {
            AllDestinationListView()
        } label: {
            Text(L10n.seeAll)
                .font(.system(size: 12, weight: .semibold))
        }
    }
    
    @ViewBuilder
    private func destinationItem(destination: Destination) -> some View {
        NavigationLink {
            PopularDestinationsDetailsView(destination: destination)
        } label: {
            PopularDestinationTile(destination: destination)
                .padding(.bottom)
        }
    }
    
    @ViewBuilder
    private func destinationList() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(destinationVM.destinations, id: \.self) { destination in
                    destinationItem(destination: destination)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct PopularDestinationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PopularDestinationsDetailsView(destination: Destination.example)
        }
    }
}
