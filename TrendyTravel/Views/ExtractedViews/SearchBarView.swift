//
//  SearchBar.swift
//  TrendyTravel
//
//  Created by N N on 17/07/2023.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    let destinations: [Destination] = [
        .init(id: 1, country: "France", city: "Paris", imageName: "eiffel_tower", latitude: 48.859565, longitude: 2.353235)
    ]

    var filteredDestinations: [Destination] {
        if searchText.isEmpty {
            return destinations
        } else {
            let lowercaseSearchText = searchText.lowercased()
            return destinations.filter { destination in
                destination.country.lowercased().contains(lowercaseSearchText) ||
                destination.city.lowercased().contains(lowercaseSearchText)
            }
        }
    }

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Where would you like to go?", text: $searchText)
            if filteredDestinations.isEmpty {
                Text("No results found")
//                    .padding()
            } else {
                Group {
                    ForEach(filteredDestinations, id: \.self) { destination in
                        NavigationLink(destination: CategoryDetailView(name: destination.city)) {
                        }
                    }
                }
            }
        }
        .opacity(filteredDestinations.isEmpty ? 0 : 1)
        .foregroundColor(.gray)
        .padding(.vertical, 8)
        .padding(.horizontal, 16)
        .background(Color(.init(white: 1, alpha: 0.3)))
        .cornerRadius(10)
        .padding(16)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    @State static var searchText = ""
    
    static var previews: some View {
        SearchBarView(searchText: $searchText)
    }
}
