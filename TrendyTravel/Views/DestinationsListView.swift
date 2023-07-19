//
//  DestinationsListView.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 26/06/2023.
//

import SwiftUI

struct DestinationsListView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.cyan, .mint]), startPoint: .top,
                               endPoint: .center)
                .ignoresSafeArea()
                Color.white
                    .offset(y: 400)
                ScrollView(showsIndicators: false) {
                    SearchBarView(searchText: $searchText)

                    DestinationsCategoriesView()

                    VStack {
                        PopularDestinationsView()
                        PopularRestaurantsView()
                        TrendingCreatorsView()
                    }
                    .background(Color.white)
                    .cornerRadius(16)
                    .padding(.top, 32)
                }
                .navigationTitle("Discover")
            }
        }
    }
}

struct DestinationsListView_Previews: PreviewProvider {
//        @EnvironmentObject var userVm = UserViewModel()
    static var previews: some View {
        DestinationsListView()
            .colorScheme(.light)
            .environmentObject(UserViewModel())
            .environmentObject(DestinationViewModel())
            .environmentObject(CategoryDetailsViewModel())
        DestinationsListView()
            .colorScheme(.dark)
            .environmentObject(UserViewModel())
            .environmentObject(DestinationViewModel())
            .environmentObject(CategoryDetailsViewModel())
    }
}
