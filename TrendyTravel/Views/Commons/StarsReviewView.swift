//
//  StarsReviewView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 18/07/2023.
//

import SwiftUI

struct StarsReviewView: View {
    var review: Review
    var body: some View {
        HStack {
            ForEach(0..<5, id: \.self) { index in
                Image(systemName: "star.fill")
                    .foregroundColor(review.rating >= index ? .orange : .white)
            }
        }
    }
}

struct StarsReviewView_Previews: PreviewProvider {
    static var previews: some View {
        StarsReviewView(review: Review.example)
    }
}
