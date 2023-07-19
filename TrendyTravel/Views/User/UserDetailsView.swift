//
//  UserDetailsView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI

struct UserDetailsView: View {
    let user: User
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                if let profileImage = user.profileImage {
                    CircleShapeImageView(image: profileImage)
                }
                Text("\(user.firstName ?? "") \(user.lastName ?? "")")
                    .font(.system(size: 14, weight: .semibold))
                
                HStack {
                    Text("@\(user.username ?? "") •")
                    Image(systemName: "hand.thumbsup.fill")
                        .font(.system(size: 10, weight: .semibold))
                    Text(L10n.UserDetailsView.numero)
                }
                .font(.system(size: 12, weight: .regular))
                
                Text(L10n.UserDetailsView.description)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(.lightGray))
                
                HStack(spacing: 12) {
                    VStack {
                        Text(L10n.UserDetailsView.Followers.numbers)
                            .font(.system(size: 13, weight: .semibold))
                        Text(L10n.UserDetailsView.Followers.followers)
                            .font(.system(size: 9, weight: .regular))
                    }
                    Spacer()
                        .frame(width: 0.5, height: 12)
                        .background(Color(.lightGray))
                    VStack {
                        Text(L10n.UserDetailsView.Following.numbers)
                            .font(.system(size: 13, weight: .semibold))
                        Text(L10n.UserDetailsView.Following.following)
                            .font(.system(size: 9, weight: .regular))
                    }
                }
                HStack(spacing: 12) {
                    Button(action: {}) {
                        HStack {
                            Spacer()
                            Text(L10n.UserDetailsView.follow)
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(Color.cyan)
                        .cornerRadius(50)
                    }
                    Button(action: {}) {
                        HStack {
                            Spacer()
                            Text(L10n.UserDetailsView.contact)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(Color(white: 0.9))
                        .cornerRadius(50)
                    }
                }
                .font(.system(size: 12, weight: .semibold))
                
                ForEach(user.posts, id: \.self) { post in
                    VStack(alignment: .leading) {
                        Image(post.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
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
                                    .foregroundColor(.cyan)
                                    .font(.system(size: 12))
                            }
                            Text(L10n.UserDetailsView.likes)
                                .font(.system(size: 12, weight: .regular))
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 6)
                    }
                    .background(Color(white: 1))
                    .cornerRadius(12)
                    .shadow(color: .init(white: 0.8), radius: 5, x: 0, y: 4)
                }
            }
            .padding(.horizontal)
        }
        .navigationBarTitle("\(user.username ?? "")",  displayMode: .inline)
    }
}

struct UserDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailsView(user: User.example)
    }
}
