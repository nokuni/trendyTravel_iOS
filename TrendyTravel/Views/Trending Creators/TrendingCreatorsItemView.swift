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
            if let profileImage = user.profileImage {
                Image(profileImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .cornerRadius(.infinity)
                    .shadow(color: .gray, radius: 2, x: 0, y: 2)
            }
            // if let firstName = user.firstName {
            Text(user.firstName)
                .font(.system(size: 11, weight: .semibold))
                .multilineTextAlignment(.center)
            // }
        }
        .frame(width: 60)
    }
}

private struct TrendingCreatorsItemView_Previews: PreviewProvider {
    static var previews: some View {
        TrendingCreatorsItemView(user: User.example)
    }
}
