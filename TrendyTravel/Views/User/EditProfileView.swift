//
//  EditProfileView.swift
//  TrendyTravel
//
//  Created by Zoé Hartman on 19/07/2023.
//

import SwiftUI
struct EditProfileView: View {
    
    @EnvironmentObject var userVM: UserViewModel
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var description: String = ""
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var profileImage: String = ""
    @State var updatedUser: User? = nil
    
    init(user: User) {
        _firstName = State(initialValue: user.firstName)
        _lastName = State(initialValue: user.lastName ?? "")
        _username = State(initialValue: user.username)
        _email = State(initialValue: user.email)
        _password = State(initialValue: user.password)
        _description = State(initialValue: user.description ?? "")
        _profileImage = State(initialValue: user.profileImage ?? "")
    }
    
    var body: some View {
        if userVM.loggedUser != nil {
            VStack{
                Form {
                    Section(header: Text("Profile Image URL")) {
                        TextField("Profile Image", text: $profileImage)
                    }
                    
                    Section(header: Text("Personal Information")) {
                        TextField("First Name", text: $firstName)
                        TextField("Last Name", text: $lastName)
                        TextField("Username", text: $username)
                        TextField("Email", text: $email)
                        SecureField("Password", text: $password)
                        TextField("Description", text: $description)
                    }
                }
                Button {
                    Task.init {
                        let updatedUserInfos = User(firstName: firstName, lastName: lastName, description: description, profileImage: profileImage, username: username, email: email, password: password)
//                        try await userVM.putUser(userID: loggedUser.id, user: updatedUserInfos)
                        userVM.loggedUser = updatedUserInfos
                    }
                } label: {
                    HStack {
                        Spacer()
                        Text("Save")
                            .foregroundColor(.black)
                            .opacity(0.97)
                        Spacer()
                    }
                    .padding(.vertical, 8)
                    .background(Color(white: 0.9))
                    .cornerRadius(50)
                }
            }
        } else {
            Text("No profile found.")
                .italic()
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EditProfileView(user: User.example)
                .environmentObject(UserViewModel())
        }
    }
}
