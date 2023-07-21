//
//  DestinationsCategoriesImageAndLabelView.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 26/06/2023.
//

import SwiftUI

struct DestinationsCategoriesImageAndLabelView: View {
    var category: Activity.Category
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: category.image)
                .font(.system(size: 20))
                .foregroundColor(Color("LightBlue"))
                .frame(width: 64, height: 64)
                .background(Color.white)
                .cornerRadius(.infinity)
            Text(category.text)
                .font(.system(size: 12, weight: .semibold))
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
        }
        .frame(width: 68)
    }
}

private struct DestinationsCategoriesImageAndLabelView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                Color("LightBlue")
                DestinationsCategoriesImageAndLabelView(category: .restaurant)
            }
        }
    }
}
