//
//  SignInView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI

struct SignInView: View {
    @FocusState var focusField: FocusField?
    @State var email: String = ""
    @State var password: String = ""
    var body: some View {
        VStack(spacing: 30) {
            logo()
            title()
            emailField()
            passwordField()
            connectButton()
            Spacer()
        }
    }
    
    @ViewBuilder
    private func logo() -> some View {
        Image("textLogo")
    }
    
    @ViewBuilder
    private func title() -> some View {
        Text("Log in")
            .font(.system(.title, design: .default, weight: .bold))
            .padding()
    }
    
    @ViewBuilder
    private func emailField() -> some View {
        FieldView(focusField: $focusField,
                  text: $email,
                  prompt: "Email",
                  focusedValue: .email,
                  submitValue: .password)
    }
    
    @ViewBuilder
    private func passwordField() -> some View {
        FieldView(focusField: $focusField,
                  text: $password,
                  prompt: "Password",
                  focusedValue: .password,
                  submitValue: .password,
                  isSecure: true,
                  isDone: true)
    }
    
    @ViewBuilder
    private func connectButton() -> some View {
        AppButtonView(label: "Connect",
                      labelColor: .white,
                      backgroundColor: .accentColor) {
            // Connection
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
