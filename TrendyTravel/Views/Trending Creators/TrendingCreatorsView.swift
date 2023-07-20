//
//  TrendingCreatorsView.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 26/06/2023.
//

import SwiftUI

struct TrendingCreatorsListView: View {
    @EnvironmentObject var userVM: UserViewModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                title()
                Spacer()
                seeAllButton()
            }
            .padding(.top)
            
            trendingCreatorList()
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func title() -> some View {
        Text(L10n.trendingCreators)
            .font(.system(size: 14, weight: .semibold))
    }
    
    @ViewBuilder
    private func seeAllButton() -> some View {
        NavigationLink {
            SeeAllCreatorsView()
        } label: {
            Text(L10n.seeAll)
                .font(.system(size: 12, weight: .semibold))
        }
    }
    
    @ViewBuilder
    private func trendingCreatorItem(user: User) -> some View {
        NavigationLink {
            UserDetailsView(user: user)
        } label: {
            TrendingCreatorsItemView(user: user)
        }
    }
    
    @ViewBuilder
    private func trendingCreatorList() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 40) {
                ForEach(userVM.users) { user in
                    trendingCreatorItem(user: user)
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}

struct TrendingCreatorsListView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorsListView()
            .environmentObject(UserViewModel())
    }
}
