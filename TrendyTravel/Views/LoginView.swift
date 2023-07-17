//
//  LoginView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI
import Utility_Toolbox

struct LoginView: View {
    @State var isSigningIn: Bool = false
    @State var isSigningUp: Bool = false
    var body: some View {
        VStack {
            appLogo()
            signInButton()
            signUpButton()
        }
        .sheet(isPresented: $isSigningIn) {
            // TODO: - Implement Sign In view
        }
        .sheet(isPresented: $isSigningUp) {
            // TODO: - Implement Sign Up view
        }
    }
    
    @ViewBuilder
    private func appLogo() -> some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .padding()
    }
    
    @ViewBuilder
    private func signButton(label: String,
                            labelColor: Color,
                            backgroundColor: Color,
                            action: (() -> Void)?) -> some View {
        Button {
            action?()
        } label: {
            Text(label)
                .font(.system(.body, design: .default, weight: .bold))
                .foregroundColor(labelColor)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    backgroundColor
                        .cornerRadius(10)
                        .shadow(color: .silver, radius: 4)
                )
        }
        .padding()
    }
    
    @ViewBuilder
    private func signInButton() -> some View {
        signButton(label: "Sign In",
                   labelColor: .blue,
                   backgroundColor: .white) {
            isSigningIn.toggle()
        }
    }
    
    @ViewBuilder
    private func signUpButton() -> some View {
        signButton(label: "Sign Up",
                   labelColor: .white,
                   backgroundColor: .blue) {
            isSigningUp.toggle()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
