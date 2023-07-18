//
//  StarRatingView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 18/07/2023.
//

import SwiftUI

struct StarRatingView: View {
    var rating: Int
    var body: some View {
        HStack {
            ForEach(0..<5, id: \.self) { index in
                Image(systemName: index >= rating ? "star" : "star.fill")
                    .foregroundColor(index >= rating ? .white : .orange)
            }
        }
    }
}

struct StarRatingView_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingView(rating: 3)
    }
}
