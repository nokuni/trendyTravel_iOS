//
//  SignUpView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI

struct SignUpView: View {
    @FocusState var focusField: FocusField?
    @State var fullName: String = ""
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack(spacing: 30) {
            logo()
            title()
            fullNameField()
            usernameField()
            emailField()
            passwordField()
            registerButton()
            Spacer()
        }
    }
    
    @ViewBuilder
    private func logo() -> some View {
        Image("textLogo")
    }
    
    @ViewBuilder
    private func title() -> some View {
        Text(L10n.SignUpView.title)
            .font(.system(.title, design: .default, weight: .bold))
            .padding()
    }
    
    @ViewBuilder
    private func fullNameField() -> some View {
        FieldView(focusField: $focusField,
                  text: $fullName,
                  prompt: L10n.SignUpView.full_name,
                  focusedValue: .fullName,
                  submitValue: .username)
    }
    
    @ViewBuilder
    private func usernameField() -> some View {
        FieldView(focusField: $focusField,
                  text: $username,
                  prompt: L10n.SignUpView.username,
                  focusedValue: .username,
                  submitValue: .email)
    }
    
    @ViewBuilder
    private func emailField() -> some View {
        FieldView(focusField: $focusField,
                  text: $email,
                  prompt: L10n.SignUpView.email,
                  focusedValue: .email,
                  submitValue: .password)
    }
    
    @ViewBuilder
    private func passwordField() -> some View {
        FieldView(focusField: $focusField,
                  text: $password,
                  prompt: L10n.SignUpView.password,
                  focusedValue: .password,
                  submitValue: .password)
    }
    
    @ViewBuilder
    private func registerButton() -> some View {
        AppButtonView(label: L10n.SignUpView.register,
                      labelColor: .white,
                      backgroundColor: .accentColor) {
            // Connection
        }
    }
}
