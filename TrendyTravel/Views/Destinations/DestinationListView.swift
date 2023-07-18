//
//  DestinationListView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 18/07/2023.
//

import SwiftUI

struct DestinationListView: View {
    var destinations: [Destination]
    var body: some View {
        ForEach(destinations, id: \.self) { destination in
            NavigationLink {
                PopularDestinationsDetailsView(destination: destination)
            } label: {
                PopularDestinationTile(destination: destination)
                    .padding(.bottom)
            }
        }
    }
}

struct DestinationListView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationListView(destinations: [])
    }
}
