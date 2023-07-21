//
//  UserProfileItemView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI

struct UserProfileItemView: View {
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        if let user = userVM.loggedUser {
            NavigationLink {
                UserDetailsView(user: user)
            } label: {
                profilePicture(user: user)
            }
        } else {
            NavigationLink {
                LoginView()
            } label: {
                Image(systemName: "person.crop.circle.fill")
                    .frame(width: 36, height: 36)
            }
        }
    }
    
    @ViewBuilder
    private func profilePicture(user: User) -> some View {
        ImageURLView(image: user.profileImage)
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

private struct UserProfileItemView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileItemView()
            .environmentObject(UserViewModel())
    }
}
