//
//  DiscoverView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI
import Utility_Toolbox

struct DiscoverView: View {
    @FocusState var focusField: FocusField?
    @EnvironmentObject var userVM: UserViewModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                background()
                scrollContent()
            }
            .navigationTitle(L10n.DiscoverView.NavigationBar.title)
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
                SearchBarView(prompt: L10n.DiscoverView.SchearchBar.prompt,
                              focusField: $focusField,
                              text: $searchText)
                if searchText.isNotEmpty {
                    SearchListView(text: $searchText)
                } else {
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
