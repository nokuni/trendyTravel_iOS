//
//  DiscoverView.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 26/06/2023.
//

import SwiftUI
import Utility_Toolbox

struct DiscoverView: View {
    @FocusState var focusField: FocusField?
    @EnvironmentObject var userVM: UserViewModel
    @State var searchText = ""

    var body: some View {
        NavigationView {
            ZStack {
                background()
                scrollContent()
            }
            .navigationTitle("Discover")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    UserProfileItemView()
                }
            }
        }
    }
    
    @ViewBuilder
    private func background() -> some View {
        VStack {
            LinearGradient(gradient: Gradient(colors: [.cyan, .mint]), startPoint: .top,
                           endPoint: .center)
            Color.white
        }
        .ignoresSafeArea()
    }
    
    @ViewBuilder
    private func scrollContent() -> some View {
        ScrollView(showsIndicators: false) {
            VStack {
                SearchBarView(prompt: "Where do you want to go?",
                              focusField: $focusField,
                              text: $searchText)
                DestinationsCategoriesView()
                VStack {
                    PopularDestinationsView()
                    PopularRestaurantsView()
                    TrendingCreatorsListView()
                }
                .background(Color.white)
                .cornerRadius(16)
            }
        }
    }
}


struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
            .colorScheme(.light)
            .environmentObject(UserViewModel())
            .environmentObject(DestinationViewModel())
            .environmentObject(CategoryDetailsViewModel())
        DiscoverView()
            .colorScheme(.dark)
            .environmentObject(UserViewModel())
            .environmentObject(DestinationViewModel())
            .environmentObject(CategoryDetailsViewModel())
    }
}
