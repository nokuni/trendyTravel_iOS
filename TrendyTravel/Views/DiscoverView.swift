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
    @Environment(\.colorScheme) var colorScheme
    @State private var searchText = ""
    
    var body: some View {
//        let loggedUser = userVM.loggedUser ?? User.errorIndicators

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
            LinearGradient(gradient: Gradient(colors: [Color("LightBlue"), Color("LightBlue"), Color("DarkBlue")]), startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            Color(colorScheme == .dark ? .black : .white)
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
                    .background(colorScheme == .dark ? .black : .white)
                    .cornerRadius(16)
                }
            }
        }
    }
}


private struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
            .colorScheme(.light)
            .environmentObject(UserViewModel())
            .environmentObject(DestinationViewModel())
            .environmentObject(CategoryDetailsViewModel())
            .environmentObject(ActivityViewModel())
        DiscoverView()
            .colorScheme(.dark)
            .environmentObject(UserViewModel())
            .environmentObject(DestinationViewModel())
            .environmentObject(CategoryDetailsViewModel())
            .environmentObject(ActivityViewModel())
    }
}
