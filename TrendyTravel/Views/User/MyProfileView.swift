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
    @EnvironmentObject var userVM: UserViewModel
    var body: some View {
        if let user = userVM.user {
            ScrollView {
                VStack(spacing: 12) {
                    if let profileImage = user.profileImage {
                        Image("\(profileImage)")
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
                    }
                    Text("\(user.firstName ?? "") \(user.lastName ?? "")")
                        .font(.system(size: 14, weight: .semibold))
                    
                    HStack {
                        Text("@\(user.username ?? "") •")
                        Image(systemName: "hand.thumbsup.fill")
                            .font(.system(size: 10, weight: .semibold))
                        Text(L10n.MyProfileView.numero)
                    }
                    .font(.system(size: 12, weight: .regular))
                    
                    Text(L10n.MyProfileView.description)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color(.lightGray))
                    
                    HStack(spacing: 12) {
                        VStack {
                            Text(L10n.MyProfileView.Followers.numbers)
                                .font(.system(size: 13, weight: .semibold))
                            Text(L10n.MyProfileView.Followers.followers)
                                .font(.system(size: 9, weight: .regular))
                        }
                        Spacer()
                            .frame(width: 0.5, height: 12)
                            .background(Color(.lightGray))
                        VStack {
                            Text(L10n.MyProfileView.Following.numbers)
                                .font(.system(size: 13, weight: .semibold))
                            Text(L10n.MyProfileView.Following.following)
                                .font(.system(size: 9, weight: .regular))
                        }
                    }
                    HStack(spacing: 12) {
                        Button(action: {}) {
                            HStack {
                                Spacer()
                                Text(L10n.MyProfileView.follow)
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
                                Text(L10n.MyProfileView.contact)
                                    .foregroundColor(.black)
                                Spacer()
                            }
                            .padding(.vertical, 8)
                            .background(Color(white: 0.9))
                            .cornerRadius(50)
                        }
                    }
                    .font(.system(size: 12, weight: .semibold))
                    
                    PostsListView(user: user)
                }
                .padding(.horizontal)
            }
            
            .navigationBarTitle("\(user.username ?? "")",  displayMode: .inline)
        }
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyProfileView()
        }
    }
}
