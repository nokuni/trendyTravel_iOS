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
                Text(L10n.TrendingCreatorsListView.title)
                    .font(.system(size: 14, weight: .semibold))
                Spacer()
                Text(L10n.TrendingCreatorsListView.see_all)
                    .font(.system(size: 12, weight: .semibold))
            }
            .padding(.top)
            .onAppear { userVM.fetchUsers() }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 40) {
                    ForEach(userVM.users) { user in
                        NavigationLink {
                            UserDetailsView(user: user)
                        } label: {
                            TrendingCreatorsItemView(user: user)
                        }
                        
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
            }
        }
        .padding(.horizontal)
    }
}

struct TrendingCreatorsListView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorsListView()
            .environmentObject(UserViewModel())
    }
}
