//
//  LoadingView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 21/07/2023.
//

import SwiftUI

struct LoadingView: View {
    @EnvironmentObject var userVM: UserViewModel
    var body: some View {
        ZStack {
            if userVM.isLoading {
                Color.white.opacity(0.7)
                ProgressView()
                    .tint(.background)
                    .padding()
                    .background(
                        Color.accentColor
                            .cornerRadius(5)
                    )
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
