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
        ScrollView {
            VStack(spacing: 12) {
                Image("\(userVM.user?.profileImage ?? "")")
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
                Text("\(userVM.user?.firstName ?? "NotFound") \(userVM.user?.lastName ?? "NotFound")")
                    .font(.system(size: 14, weight: .semibold))
                
                HStack {
                    Text("@\(userVM.user?.username ?? "NotFound") •")
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
                if let firstName = userVM.user?.firstName {
                    Text(firstName)
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                }
            }
            .padding(.all, 8)
            .padding(.vertical,20)
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
