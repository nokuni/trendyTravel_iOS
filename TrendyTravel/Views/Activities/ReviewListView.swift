//
//  ReviewListView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI

struct ReviewList: View {
    var reviews: [Review] = [Review(id: 0, content: L10n.RestaurantDetailsView.content, rating: 5, userID: 0, activityID: 0)]
    var body: some View {
        HStack {
            Text(L10n.ReviewList.title)
                .font(.system(size: 16, weight: .bold))
            Spacer()
        }
        .padding(.horizontal)
            ForEach(reviews, id: \.self) { review in
                VStack(alignment: .leading) {
                    HStack {
                        Image("billy")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44)
                                .clipShape(Circle())
                           
                        VStack(alignment: .leading, spacing: 4) {
                            Text(L10n.ReviewList.name)
                                .font(.system(size: 14,weight: .bold))
                            HStack(spacing: 4) {
                                ForEach(0..<5, id: \.self) { rating in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(rating < review.rating ? .orange : .gray)
                                        .font(.system(size: 12))
                                }
                            }
                        }
                        Spacer()
                        Text(L10n.ReviewList.date)
                            .font(.system(size: 14, weight: .bold))
                    }
                    Text(review.content)
                        .font(.system(size: 14, weight: .regular))
                }
                .padding(.horizontal)
            }
        }
}
