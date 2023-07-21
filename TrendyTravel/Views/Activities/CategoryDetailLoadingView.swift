//
//  CategoryDetailLoadingView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 18/07/2023.
//

import SwiftUI

struct CategoryDetailLoadingView: View {
    var body: some View {
        VStack {
            ActivityIndicatorView()
            Text(L10n.CategoryDetailLoadingView.loarding)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .semibold))
        }
        .padding()
        .background(Color("DarkBlue"))
        .cornerRadius(8)
    }
}

private struct CategoryDetailLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailLoadingView()
    }
}
