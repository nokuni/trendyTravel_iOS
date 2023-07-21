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
    @Binding var isSigningUp: Bool
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var description: String = ""
    @State var selectedImageData: Data?
    @State private var hasEnteredPrimaryInfos: Bool = false
    var hasFieldsBeenFilled: Bool {
        firstName.isNotEmpty && lastName.isNotEmpty && username.isNotEmpty && email.isNotEmpty && password.isNotEmpty
    }
    var canRegister: Bool {
        selectedImageData != nil && description.isNotEmpty
    }
    
    var body: some View {
        VStack {
            logo()
            title()
            if hasEnteredPrimaryInfos {
                VStack(spacing: 10) {
                    PhotoSelectionView(selectedImageData: $selectedImageData)
                    TextField("Description", text: $description, axis: .vertical)
                        .padding(16)
                        .background(Color.ultraLightGray.cornerRadius(8))
                        .padding()
                        .limitText(text: $description, limit: 100)
                    registerButton()
                    previousButton()
                    Spacer()
                }
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
        Text(hasEnteredPrimaryInfos ? L10n.signUp : "Enter your informations")
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
                      backgroundColor: .accentColor,
                      padding: .horizontal) {
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
                      backgroundColor: canRegister ? .green : .gray,
                      padding: .horizontal) {
            isSigningUp.toggle()
            userVM.isLoading.toggle()
            if let data = selectedImageData,
               let image = UIImage(data: data) {
                userVM.signUp(firstName: firstName, lastName: lastName, description: description, image: image, username: username, email: email, password: password)
            }
        }
                      .disabled(!canRegister)
    }
}
