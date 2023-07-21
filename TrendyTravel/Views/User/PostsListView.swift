//
//  PostsListView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI

struct PostsListView: View {
    
    @EnvironmentObject var userVM: UserViewModel
    var user: User
    
    var body: some View {
        ForEach(user.posts, id: \.self) { post in
            VStack(alignment: .leading) {
                ZStack{
                    Image(post.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 200)
                        .clipped()
                    if user.id == userVM.userID ??  0{
                        VStack{
                            HStack {
                                Spacer()
                                Button(action: {
                                    //EditPostView()
                                }, label: {
                                    Image(systemName: "pencil")
                                        .font(.system(size: 20))
                                        .foregroundColor(Color.cyan)
                                        .frame(width: 44, height: 44)
                                        .background(Color.white)
                                        .cornerRadius(.infinity)
                                })
                            }
                            Spacer()
                        }
                    }
                }
                HStack(alignment: .top) {
                    if let profileImage = user.profileImage {
                        Image(profileImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 34)
                            .clipShape(Circle())
                    }
                    VStack(alignment: .leading) {
                        Text(post.title)
                            .font(.system(size: 14, weight: .semibold))
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
                }
                .padding(.horizontal, 8)
                
                HStack {
                    Button {
                        // action pour ajouter des likes
                    } label: {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(.accentColor)
                            .font(.system(size: 12))
                    }
                    Text(L10n.PostsListView.likes)
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                .padding(.bottom, 6)
            }
            .background(Color(white: 1))
            .cornerRadius(12)
            .shadow(color: .init(white: 0.8), radius: 5, x: 0, y: 4)
            .frame(maxHeight:280)
        }
    }
}

struct PostsListView_Previews: PreviewProvider {
    static var previews: some View {
        PostsListView(user: User.example)
            .environmentObject(UserViewModel())
    }
}
