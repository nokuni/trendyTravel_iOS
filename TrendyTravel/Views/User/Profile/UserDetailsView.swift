//
//  UserDetailsView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI

struct UserDetailsView: View {
    @EnvironmentObject var userVM: UserViewModel
    let user: User
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                profilePicture()
                profileName()
                usernameAndLikes()
                profileDescription()
                followCount()
                HStack(spacing: 12) {
                    followButton()
                    contactButton()
                }
                .font(.system(size: 12, weight: .semibold))
                
                UserProfilePostListView(user: user)
            }
            .padding(.horizontal)
        }
        .navigationBarTitle("\(user.username)",  displayMode: .inline)
    }
    
    @ViewBuilder
    private func profilePicture() -> some View {
        ImageURLView(image: user.profileImage)
            .scaledToFill()
            .frame(width: 80, height: 80)
            .clipShape(Circle())
            .shadow(radius: 10)
            .overlay(
                Circle()
                    .stroke(Color.cyan.opacity(0.6), lineWidth: 2)
                    .frame(width: 80, height: 80)
            )
    }
    
    @ViewBuilder
    private func profileName() -> some View {
        Text("\(user.firstName) \(user.lastName)")
            .font(.system(size: 14, weight: .semibold))
    }
    
    @ViewBuilder
    private func usernameAndLikes() -> some View {
        HStack {
            Text("@\(user.username) •")
            Image(systemName: "hand.thumbsup.fill")
                .font(.system(size: 10, weight: .semibold))
            Text("\(userVM.userLikes(user: user))")
        }
        .font(.system(size: 12, weight: .regular))
    }
    
    @ViewBuilder
    private func profileDescription() -> some View {
        Text(user.description)
            .font(.system(size: 14, weight: .regular))
            .foregroundColor(Color(.lightGray))
    }
    
    @ViewBuilder
    private func followerCount() -> some View {
        VStack {
            Text("\(user.followers?.count ?? 0)")
                .font(.system(size: 13, weight: .semibold))
            Text(L10n.followers)
                .font(.system(size: 9, weight: .regular))
        }
    }
    
    @ViewBuilder
    private func followinCount() -> some View {
        VStack {
            Text("\(userVM.userFollowing(user: user))")
                .font(.system(size: 13, weight: .semibold))
            Text(L10n.following)
                .font(.system(size: 9, weight: .regular))
        }
    }
    
    @ViewBuilder
    private func followCount() -> some View {
        HStack(spacing: 12) {
            followerCount()
            Divider()
            followinCount()
        }
    }
    
    @ViewBuilder
    private func followButton() -> some View {
        Button {
            // Follow action
        } label: {
            HStack {
                Spacer()
                Text(L10n.follow)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.vertical, 8)
            .background(Color.cyan)
            .cornerRadius(50)
        }
    }
    
    @ViewBuilder
    private func contactButton() -> some View {
        Button(action: {
            
        }) {
            HStack {
                Spacer()
                Text(L10n.contact)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.vertical, 8)
            .background(Color(white: 0.9))
            .cornerRadius(50)
        }
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView(user: User.example)
    }
}
