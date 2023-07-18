//
//  AllDestinationListView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 18/07/2023.
//

import SwiftUI
import Utility_Toolbox

struct AllDestinationListView: View {
    @EnvironmentObject var destinationVM: DestinationViewModel
    @State var searchText = ""
    var body: some View {
        ScrollView {
            VStack {
                ForEach(searchedDestinations, id: \.self) { destination in
                    destinationItem(destination: destination)
                }
            }
        }
        .navigationTitle("Destinations")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchText, prompt: "Destinations")
    }
    
    var searchedDestinations: [Destination] {
        if searchText.isEmpty {
            return destinationVM.destinations
        } else {
            return destinationVM.destinations.filter {
                $0.country.localizedCaseInsensitiveContains(searchText) ||
                $0.city.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    @ViewBuilder
    private func destinationItem(destination: Destination) -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text(destination.country.capitalized)
                    .font(.system(.title2, design: .default, weight: .bold))
                    .foregroundColor(.aluminium)
                Text(destination.city.capitalized)
                    .font(.system(.title3, design: .default, weight: .regular))
                    .foregroundColor(.aluminium)
            }
            ImageURLView(image: destination.imageName)
                .cornerRadius(5)
                .frame(maxWidth: .infinity, maxHeight: CGSize.screen.height * 0.3)
        }
        .padding()
    }
}

struct AllDestinationListView_Previews: PreviewProvider {
    static var previews: some View {
        AllDestinationListView()
    }
}
