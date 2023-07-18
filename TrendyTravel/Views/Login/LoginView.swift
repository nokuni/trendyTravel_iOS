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
            SignInView()
        }
        .sheet(isPresented: $isSigningUp) {
            SignUpView()
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
    private func signInButton() -> some View {
        AppButtonView(label: L10n.LoginView.signIn,
                      labelColor: .blue,
                      backgroundColor: .white) {
            isSigningIn.toggle()
        }
    }
    
    @ViewBuilder
    private func signUpButton() -> some View {
        AppButtonView(label: L10n.LoginView.signUp,
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
