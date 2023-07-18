//
//  AllDestinationsListView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 18/07/2023.
//

import SwiftUI
import Utility_Toolbox

struct AllDestinationsListView: View {
    @EnvironmentObject var destinationVM: DestinationViewModel
    @State var searchText = ""
    var body: some View {
        ScrollView {
            VStack {
                ForEach(searchDestinations, id: \.self) { destination in
                    NavigationLink {
                        PopularDestinationsDetailsView(destination: destination)
                    } label: {
                        destinationRow(destination: destination)
                    }
                }
            }
        }
        .navigationTitle("Destinations")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchText)
    }
    
    var searchDestinations: [Destination] {
        if searchText.isEmpty {
            return destinationVM.destinations
        } else {
            return destinationVM.destinations.filter {
                $0.city.contains(searchText) || $0.country.contains(searchText)
            }
        }
    }
    
    @ViewBuilder
    private func destinationRow(destination: Destination) -> some View {
        VStack(alignment: .leading) {
            destinationLocationNames(destination: destination)
            destinationImage(destination: destination)
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func destinationLocationNames(destination: Destination) -> some View {
        HStack {
            Text("\(destination.country) -")
                .font(.system(.title2, design: .default, weight: .bold))
                .foregroundColor(.primary)
            Text("\(destination.city)")
                .font(.system(.title3, design: .default, weight: .regular))
                .foregroundColor(.aluminium)
        }
    }
    
    @ViewBuilder
    private func destinationImage(destination: Destination) -> some View {
        Image(destination.imageName)
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
    }
}

struct AllDestinationsListView_Previews: PreviewProvider {
    static var previews: some View {
        AllDestinationsListView()
    }
}
