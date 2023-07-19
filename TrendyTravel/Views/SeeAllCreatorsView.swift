//
//  SeeAllCreatorsView.swift
//  TrendyTravel
//
//  Created by Thibault GODEFROY on 18/07/2023.
//

import SwiftUI

struct SeeAllCreatorsView: View {
    @State private var searchText: String = ""
    @EnvironmentObject var vm: UserViewModel
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    ForEach(vm.users, id: \.self) { user in
                        HStack {
                            Image(user.profilImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .cornerRadius(.infinity)
                            VStack(alignment: .leading){
                                Text(user.firstName)
                                    .font(.system(size: 25, weight: .semibold))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color(.label))
                                Text(user.description)
                            }
                            Spacer()
                        }
                    }
                }
                .shadow(color: .gray, radius: 2, x: 0, y: 2)
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Trending Creators")
                }
            }
        }
        .searchable(text: $searchText)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SeeAllCreatorsView_Previews: PreviewProvider {
    static var previews: some View {
        SeeAllCreatorsView()
            .environmentObject(UserViewModel())
    }
}
