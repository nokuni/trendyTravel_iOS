//
//  DestinationsListView.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 26/06/2023.
//

import SwiftUI

struct DestinationsListView: View {
    
    var tempUserInfo: User = User(id: 1, firstName: "Jean", lastName: "Weekend", description: "This is not an Instagram account", profilImage: "billy", pseudo: "user", password: "1234", email: "temp@gmail.com", posts: [Post(id: 1, title: "Last Christmas", imageName: "new_york", hashtags: ["new york", "nyc", "blessed"], userID: 1)])
    @State private var tempIsUserLoggedIn: Bool = true
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.cyan, .mint]), startPoint: .top,
                               endPoint: .center)
                .ignoresSafeArea()
                Color.white
                    .offset(y: 500)
                ScrollView(showsIndicators: false) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go?")
                        Spacer()
                    }
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.3)))
                    .cornerRadius(10)
                    .padding(16)
                    DestinationsCategoriesView()
                    VStack {
                        PopularDestinationsView()
                        PopularRestaurantsView()
                        TrendingCreatorsView()
                    }
                    .background(Color.white)
                    .cornerRadius(16)
                    .padding(.top, 32)
                }
                
                .navigationTitle("Discover")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        if tempIsUserLoggedIn {
                            NavigationLink(destination:  MyProfileView(loggedUser: tempUserInfo)) {
                                HStack(spacing: 8){
                                    if let imageName = tempUserInfo.profilImage, !imageName.isEmpty {
                                        Image(imageName)
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
                                    .foregroundColor(.black.opacity(0.95))
                                    .padding(.bottom, 8)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct DestinationsListView_Previews: PreviewProvider {
    static var previews: some View {
        DestinationsListView()
            .colorScheme(.light)
            .environmentObject(UserViewModel())
            .environmentObject(DestinationViewModel())
            .environmentObject(CategoryDetailsViewModel())
        DestinationsListView()
            .colorScheme(.dark)
            .environmentObject(UserViewModel())
            .environmentObject(DestinationViewModel())
            .environmentObject(CategoryDetailsViewModel())
    }
}
