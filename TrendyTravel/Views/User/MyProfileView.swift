//
//  MyProfileView.swift
//  TrendyTravel
//
//  Created by Zoé Hartman on 17/07/2023.
//

import Foundation
import SwiftUI

struct MyProfileView: View {
    
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        
        let loggedUser = userVM.loggedUser ?? User.errorIndicators
        
        //if preview crashes, remove line below and else/Discover() statements
        if userVM.isUserConnected {
            ScrollView {
                VStack(spacing: 12) {
                    profilePicture(userImage: loggedUser.profileImage ?? "")
                    name(loggedUser: loggedUser)
                    
                    HStack {
                        username(loggedUser: loggedUser)
                        likesCount(loggedUser: loggedUser)
                    }
                    .font(.system(size: 12, weight: .regular))
                    
                    profileDescription(loggedUser: loggedUser)
                    followCounts()
                    editProfileButton(loggedUser: loggedUser)
                    userPosts(loggedUser: loggedUser)
                    
                    Spacer().frame(height: 50)
                    logOutButton()
                    deleteAccountButton()
                }
                .padding(.all, 8)
                .padding(.vertical,20)
            }
        }
        //if user is not logged in, goes back to Home page
        else {
            DiscoverView()
        }
    }
    
    @ViewBuilder
    private func profilePicture(userImage: String) -> some View {
        if userImage.isEmpty {
            Image(systemName: "person.crop.circle.badge.exclamationmark")
                .font(.system(size: 80))
        } else {
            Image(userImage)
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
    }
    
    @ViewBuilder
    private func name(loggedUser: User) -> some View {
        Text("\(loggedUser.firstName ) \(loggedUser.lastName ?? "")")
            .font(.system(size: 14, weight: .semibold))
    }
    
    @ViewBuilder
    private func username(loggedUser: User) -> some View {
        Text("@\(loggedUser.username )•")
    }
    
    @ViewBuilder
    private func likesCount(loggedUser: User) -> some View {
        Image(systemName: "hand.thumbsup.fill")
            .font(.system(size: 10, weight: .semibold))
        Text("2541")
    }
    
    @ViewBuilder
    private func profileDescription(loggedUser: User) -> some View {
        if let description = loggedUser.description, loggedUser.description != ""  {
            Text(description)
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color(.black)).opacity(0.35)
        } else {
            Text("MyProfileView.NO_DESCRIPTION")
                .font(.system(size: 13, weight: .regular))
                .foregroundColor(Color(.black)).opacity(0.35)
                .italic()
        }
    }
    
    @ViewBuilder
    private func followCounts() -> some View {
        HStack(spacing: 12) {
            VStack {
                Text("3")
                    .font(.system(size: 13, weight: .semibold))
                Text("MyProfileView.FOLLOWERS")
                    .font(.system(size: 9, weight: .regular))
            }
            Spacer()
                .frame(width: 0.5, height: 12)
                .background(Color(.lightGray))
            VStack {
                Text("2")
                    .font(.system(size: 13, weight: .semibold))
                Text("MyProfileView.FOLLOWING")
                    .font(.system(size: 9, weight: .regular))
            }
        }
    }
    
    @ViewBuilder
    private func editProfileButton(loggedUser:User) -> some View {
        NavigationLink {
            EditProfileView(user: loggedUser)
        } label: {
            HStack {
                Spacer()
                Text("MyProfileView.EDIT_PROFILE")
                    .foregroundColor(.black)
                    .opacity(0.97)
                Spacer()
            }
            .padding(.vertical, 8)
            .background(Color(white: 0.9))
            .cornerRadius(50)
        }
    }
    
    @ViewBuilder
    private func userPosts(loggedUser:User) -> some View {
        NavigationLink {
            //TODO: this link
            //            CreatePostView()
        } label: {
            HStack {
                Spacer()
                Text("MyProfileView.NEW_POST")
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .opacity(0.97)
                Spacer()
            }
            .padding(.vertical, 8)
            .background(Color.blue)
            .cornerRadius(50)
        }
        PostsListView(user: loggedUser)
    }
    
    @ViewBuilder
    private func logOutButton() -> some View {
        Button {
            userVM.userID = nil
            userVM.loggedUser = nil
        } label: {
            HStack {
                Spacer()
                Text("MyProfileView.LOG_OUT")
                    .foregroundColor(.red)
                    .opacity(0.97)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.vertical, 8)
            .background(Color(white: 0.9))
            .cornerRadius(50)
        }
    }
    
    @ViewBuilder
    private func deleteAccountButton() -> some View{
        Button {
            userVM.userID = nil
            userVM.loggedUser = nil
            //TODO: delete account link
        } label: {
            HStack {
                Spacer()
                Text("MyProfileView.DELETE_ACCOUNT")
                    .foregroundColor(.white)
                    .opacity(0.97)
                    .fontWeight(.semibold)
                Spacer()

            }
            .padding(.vertical, 8)
            .background(Color.red)
            .cornerRadius(50)
        }
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyProfileView()
                .environmentObject(UserViewModel())
        }
    }
}
