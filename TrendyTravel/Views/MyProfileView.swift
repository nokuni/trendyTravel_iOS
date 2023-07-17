//
//  MyProfileView.swift
//  TrendyTravel
//
//  Created by Zoé Hartman on 17/07/2023.
//

import Foundation
import SwiftUI

//temp comp, copied form user view
struct MyProfileView: View {
    let loggedUser: User
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                Image("\(loggedUser.profilImage)")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .overlay(
                        Circle()
                            .stroke(Color.cyan.opacity(0.6), lineWidth: 2)
                            .frame(width: 80, height: 80)
                    )
                Text("\(loggedUser.firstName) \(loggedUser.lastName)")
                    .font(.system(size: 14, weight: .semibold))
                
                HStack {
                    Text("@\(loggedUser.pseudo) •")
                    Image(systemName: "hand.thumbsup.fill")
                        .font(.system(size: 10, weight: .semibold))
                    Text("2541")
                }
                .font(.system(size: 12, weight: .regular))
                
                Text("YouTuber, Vlogger, Travel Creator")
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(Color(.lightGray))
                
                HStack(spacing: 12) {
                    VStack {
                        Text("3")
                            .font(.system(size: 13, weight: .semibold))
                        Text("Followers")
                            .font(.system(size: 9, weight: .regular))
                    }
                    Spacer()
                        .frame(width: 0.5, height: 12)
                        .background(Color(.lightGray))
                    VStack {
                        Text("2")
                            .font(.system(size: 13, weight: .semibold))
                        Text("Following")
                            .font(.system(size: 9, weight: .regular))
                    }
                }
                HStack(spacing: 12) {
                    Button(action: {}) {
                        HStack {
                            Spacer()
                            Text("Follow")
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
                            Text("Contact")
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .padding(.vertical, 8)
                        .background(Color(white: 0.9))
                        .cornerRadius(50)
                    }
                }
                .font(.system(size: 12, weight: .semibold))
                
                ForEach(loggedUser.posts, id: \.self) { post in
                    VStack(alignment: .leading) {
                        Image(post.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .clipped()
                        HStack(alignment: .top) {
                            Image(loggedUser.profilImage)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 34)
                                .clipShape(Circle())
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
                            Text("102 likes")
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
        .navigationBarTitle("\(loggedUser.pseudo)",  displayMode: .inline)
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyProfileView(loggedUser: User(id: 0, firstName: "john", lastName: "doe", description: "hello I'm new", profilImage: "billy", pseudo: "jo.D", password: "kkk", email: "jo.d@gmail.com", posts: [Post(id: 0, title: "1st post", imageName: "eiffel_tower", hashtags: ["paradise", "lost"], userID: 0)]))
        }
    }
}
