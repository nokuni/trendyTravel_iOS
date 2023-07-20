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
                Text(L10n.PopularDestinationsView.title)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.black)
                Spacer()
                Text(L10n.PopularDestinationsView.see_all)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundColor(.black)
            }
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(destinationVM.destinations, id: \.self) { destination in
                        NavigationLink {
                            PopularDestinationsDetailsView(destination: destination)
                        } label: {
                            PopularDestinationTile(destination: destination)
                                .padding(.bottom)
                        }
                    }
                }
                .padding(.horizontal)
            }
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
