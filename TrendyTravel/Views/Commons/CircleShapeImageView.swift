//
//  CircleShapeImageView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI

struct CircleShapeImageView: View {
    var image: String
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: 80)
            .clipShape(Circle())
            .shadow(radius: 10)
            .overlay(
                Circle()
                    .stroke(Color.accentColor.opacity(0.6), lineWidth: 2)
                    .frame(width: 80, height: 80)
            )
    }
}

struct CircleShapeImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleShapeImageView(image: "amy")
    }
}
