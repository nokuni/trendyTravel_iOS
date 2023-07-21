//
//  SearchListView.swift
//  TrendyTravel
//
//  Created by N N on 19/07/2023.
//

import SwiftUI

struct SearchListView: View {
    @EnvironmentObject var destinationVM : DestinationViewModel
    @Binding var text: String

    var body: some View {

        ScrollView(.vertical, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(filteredDestinations, id: \.id) { destination in
                    NavigationLink(destination: Text(destination.city)) {
                        DestinationItemView(destination: destination)
                    }
                    .foregroundColor(.white)
                }
            }
            .padding()
        }
    }

    var filteredDestinations: [Destination] {
        if text.isEmpty {
            return destinationVM.destinations
        } else {
            let lowercaseSearchText = text.lowercased()
            return destinationVM.destinations.filter { destination in
                destination.country.lowercased().contains(lowercaseSearchText) ||
                destination.city.lowercased().contains(lowercaseSearchText)
            }
        }
    }
}

struct DestinationItemView: View {
    let destination: Destination

    var body: some View {
        VStack {
            image()

            HStack{
                VStack(alignment: .leading) {
                    Text("\(destination.city)")
                        .foregroundColor(.black)
                    Text("\(destination.country)")
                        .foregroundColor(.gray)
                    Spacer()
                }
                .font(.system(size: 12, weight: .semibold))
                .lineLimit(2)
                .multilineTextAlignment(.center)
                Spacer()
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 4)
        }
        .background(.white)
        .frame(width: 120, height: 158)
        .cornerRadius(12)
    }

    @ViewBuilder
        private func image() -> some View {
            if let url = URL(string: destination.imageName) {
                AsyncImage(url: url) { phase in
                    if let image = phase.image {
                        image.resizable()
                    } else if phase.error != nil {
                        Color.silver
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 100, height: 100)
                .cornerRadius(2)
                .padding(.top, 8)
            }
        }
}

struct SearchListView_Previews: PreviewProvider {
    static let destinations: [Destination] = [
        .init(id: 1, country: "France", city: "Paris", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235),
        .init(id: 2, country: "Italy", city: "Rome", imageName: "colosseum", latitude: 41.890210, longitude: 12.492231),
        .init(id: 3, country: "USA", city: "New York", imageName: "statue_of_liberty", latitude: 40.689247, longitude: -74.044502)
    ]

    static var previews: some View {
        SearchListView(text: .constant(""))
            .environmentObject(DestinationViewModel())
    }
}
