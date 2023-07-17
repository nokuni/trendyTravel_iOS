//
//  UserProfileItemView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI

struct UserProfileItemView: View {
    @EnvironmentObject var userVM: UserViewModel
    var body: some View {
        NavigationLink(destination: MyProfileView()) {
            VStack(alignment: .trailing, spacing: 3) {
                if let imageName = userVM.user?.profileImage, !imageName.isEmpty {
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 36, height: 36)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 36, height: 36)
                        .foregroundColor(.white.opacity(0.98))
                }
                if let firstName = userVM.user?.firstName {
                    Text(firstName)
                        .foregroundColor(.white)
                        .font(.system(size: 14))
                }
            }
            .padding(.all, 8)
            .padding(.vertical,20)
        }
    }
}

struct UserProfileItemView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileItemView()
    }
}
