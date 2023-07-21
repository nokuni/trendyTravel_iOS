//
//  TrendingCreatorsItemView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI

struct TrendingCreatorsItemView: View {
    let user: User
    var body: some View {
        VStack {
            image()
            Text(user.firstName)
                .font(.system(size: 11, weight: .semibold))
                .multilineTextAlignment(.center)
                .foregroundColor(Color(.label))
        }
        .frame(width: 60)
    }
    
    @ViewBuilder
    private func image() -> some View {
        ImageURLView(image: user.profileImage)
            .frame(width: 80, height: 80)
            .cornerRadius(.infinity)
    }
    
    @ViewBuilder
    private func firstName() -> some View {
        Text(user.firstName)
            .font(.system(size: 11, weight: .semibold))
            .multilineTextAlignment(.center)
            .foregroundColor(Color(.label))
    }
}

private struct TrendingCreatorsItemView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorsItemView(user: User.example)
    }
}
