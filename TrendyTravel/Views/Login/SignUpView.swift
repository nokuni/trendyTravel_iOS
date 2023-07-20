//
//  SignUpView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI
import Utility_Toolbox
import PhotosUI

struct SignUpView: View {
    @EnvironmentObject var userVM: UserViewModel
    @FocusState private var focusField: FocusField?
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var description: String = ""
    @State private var hasEnteredPrimaryInfos: Bool = false
    var hasFieldsBeenFilled: Bool {
        firstName.isNotEmpty && lastName.isNotEmpty && username.isNotEmpty && email.isNotEmpty && password.isNotEmpty
    }
    var body: some View {
        VStack {
            logo()
            title()
            if hasEnteredPrimaryInfos {
                PhotoSelectionView()
                TextField("Description", text: $description, axis: .vertical)
                registerButton()
                previousButton()
                Spacer()
            } else {
                VStack(spacing: 20) {
                    firstNameField()
                    lastNameField()
                    usernameField()
                    emailField()
                    passwordField()
                }
                nextButton()
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    private func logo() -> some View {
        Image("textLogo")
    }
    
    @ViewBuilder
    private func title() -> some View {
        Text(L10n.signUp)
            .font(.system(.title, design: .default, weight: .bold))
            .padding()
    }
    
    @ViewBuilder
    private func firstNameField() -> some View {
        FieldView(focusField: $focusField,
                  text: $firstName,
                  prompt: L10n.firstName,
                  focusedValue: .firstName,
                  submitValue: .username)
    }
    
    @ViewBuilder
    private func lastNameField() -> some View {
        FieldView(focusField: $focusField,
                  text: $lastName,
                  prompt: L10n.lastName,
                  focusedValue: .lastName,
                  submitValue: .username)
    }
    
    @ViewBuilder
    private func usernameField() -> some View {
        FieldView(focusField: $focusField,
                  text: $username,
                  prompt: L10n.username,
                  focusedValue: .username,
                  submitValue: .email)
    }
    
    @ViewBuilder
    private func emailField() -> some View {
        FieldView(focusField: $focusField,
                  text: $email,
                  prompt: L10n.email,
                  focusedValue: .email,
                  submitValue: .password)
    }
    
    @ViewBuilder
    private func passwordField() -> some View {
        FieldView(focusField: $focusField,
                  text: $password,
                  prompt: L10n.password,
                  focusedValue: .password,
                  submitValue: .password)
    }
    
    @ViewBuilder
    private func previousButton() -> some View {
        AppButtonView(label: L10n.previous,
                      labelColor: .white,
                      backgroundColor: .accentColor) {
            hasEnteredPrimaryInfos.toggle()
        }
                      .disabled(!hasFieldsBeenFilled)
    }
    
    @ViewBuilder
    private func nextButton() -> some View {
        AppButtonView(label: L10n.next,
                      labelColor: .white,
                      backgroundColor: .accentColor) {
            hasEnteredPrimaryInfos.toggle()
        }
                      .disabled(!hasFieldsBeenFilled)
    }
    
    @ViewBuilder
    private func registerButton() -> some View {
        AppButtonView(label: L10n.register,
                      labelColor: .white,
                      backgroundColor: .accentColor) {
//            let user = User(firstName: firstName,
//                            lastName: lastName,
//                            description: "",
//                            profileImage: "",
//                            username: username,
//                            email: email,
//                            password: password)
//            userVM.signUp(user: user)
        }
    }
}
