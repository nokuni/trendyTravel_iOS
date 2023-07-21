//
//  AttractionDetailsView.swift
//  TrendyTravel
//
//  Created by Amelie Pocchiolo on 20/07/2023.
//

import SwiftUI

struct AttractionDetailsView: View {
    let attraction: Attraction
    var body: some View {
        VStack {
            Spacer()
            Image(attraction.imageName)
                .resizable()
                .frame(width: 300, height: 300)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color(.init(white: 0, alpha: 0.5)))
                )
            Spacer()
            Text(attraction.name)
                .font(.system(size: 16, weight: .semibold))
            Spacer()
        }
        .navigationTitle(L10n.AttractionDetailsView.title)
    }
}

struct AttractionDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AttractionDetailsView(attraction: Attraction.example)
    }
}
