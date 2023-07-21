//
//  SeeAllCreatorsView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 19/07/2023.
//

import SwiftUI

struct SeeAllCreatorsView: View {
    @State private var searchText: String = ""
    @EnvironmentObject var vm: UserViewModel
    var body: some View {
        userList()
            .padding()
            .searchable(text: $searchText)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Trending Creators")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    private func userRow(user: User) -> some View {
        HStack {
            ImageURLView(image: user.profileImage)
                .scaledToFill()
                .frame(width: 100, height: 100)
                .cornerRadius(.infinity)
            VStack(alignment: .leading){
                Text("\(user.firstName) - @\(user.username)")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(.label))
                Text(user.description)
                    .foregroundColor(.tin)
            }
            Spacer()
        }
    }
    
    @ViewBuilder
    private func userList() -> some View {
        ScrollView {
            VStack {
                ForEach(vm.users) { user in
                    NavigationLink {
                        UserDetailsView(user: user)
                    } label: {
                        userRow(user: user)
                    }
                }
            }
        }
    }
}


struct SeeAllCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        SeeAllCreatorsView()
    }
}
