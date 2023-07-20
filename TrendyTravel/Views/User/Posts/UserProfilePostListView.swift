//
//  UserProfilePostListView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 19/07/2023.
//

import SwiftUI

struct UserProfilePostListView: View {
    @EnvironmentObject var userVM: UserViewModel
    var user: User
    var body: some View {
        ForEach(userVM.userPosts(user: user)) { post in
            VStack(alignment: .leading) {
                postImage(post: post)
                HStack(alignment: .top) {
                    profileImage()
                    VStack(alignment: .leading) {
                        postTitle(post: post)
                        hashtags(post: post)
                    }
                }
                .padding(.horizontal, 8)
                
                likeButton()
            }
            .background(Color(white: 1))
            .cornerRadius(12)
            .shadow(color: .init(white: 0.8), radius: 5, x: 0, y: 4)
        }
    }
    
    @ViewBuilder
    private func postImage(post: Post) -> some View {
        ImageURLView(image: post.imageName)
            .scaledToFill()
            .frame(height: 200)
            .clipped()
    }
    
    @ViewBuilder
    private func profileImage() -> some View {
        if let profileImage = user.profileImage {
            Image(profileImage)
                .resizable()
                .scaledToFit()
                .frame(height: 34)
                .clipShape(Circle())
        }
    }
    
    @ViewBuilder
    private func postTitle(post: Post) -> some View {
        Text(post.title)
            .font(.system(size: 14, weight: .semibold))
    }
    
    @ViewBuilder
    private func hashtags(post: Post) -> some View {
        HStack {
            ForEach(post.hashtags, id: \.self) { hashtag in
                Text("#\(hashtag)")
                    .foregroundColor(Color.purple)
                    .font(.system(size: 13, weight: .semibold))
                    .padding(.horizontal, 12)
                    .padding(.vertical, 2)
                    .background(Color.purple.opacity(0.2))
                    .cornerRadius(20)
            }
        }
    }
    
    @ViewBuilder
    private func likeButton() -> some View {
        HStack {
            Button {
                // action pour ajouter des likes
            } label: {
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundColor(.cyan)
                    .font(.system(size: 12))
            }
            Text(L10n.likes)
                .font(.system(size: 12, weight: .regular))
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
        .padding(.bottom, 6)
    }
}

struct UserProfilePostListView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfilePostListView(user: User.example)
    }
}
