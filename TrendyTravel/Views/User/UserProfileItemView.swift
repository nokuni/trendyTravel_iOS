//
//  UserProfileItemView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI

struct UserProfileItemView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var userVM: UserViewModel

    var body: some View {
        if userVM.isUserConnected{
            NavigationLink(destination:  MyProfileView()) {
                ZStack{
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .foregroundColor(colorScheme == .dark ? .white.opacity(0.95) : .black.opacity(0.95))
                        .padding(.bottom, 8)
                    if let loggedUserImage = userVM.user?.profileImage, !loggedUserImage.isEmpty {
                        Image(loggedUserImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 41, height: 41)
                            .clipShape(Circle())
                            .padding(.bottom, 8)
                    }
                }
            }
        } else {
            NavigationLink(destination: LoginView()) {
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .frame(width: 36, height: 36)
                    .foregroundColor(colorScheme == .dark ? .white : .black)
                    .padding(.bottom, 8)
            }
        }
    }
}

struct UserProfileItemView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileItemView()
            .environmentObject(UserViewModel())
    }
}
