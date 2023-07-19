//
//  ReviewListView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI

struct ReviewList: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var activityVM: ActivityViewModel
    var activity: Activity
    var body: some View {
        HStack {
            Text(L10n.ReviewList.title)
                .font(.system(size: 16, weight: .bold))
            Spacer()
        }
        .padding(.horizontal)
        ForEach(activityVM.activityReviews(activity), id: \.self) { review in
                VStack(alignment: .leading) {
                    HStack {
                        Image("billy")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 44)
                                .clipShape(Circle())
                           
                        VStack(alignment: .leading, spacing: 4) {
                            if let user = userVM.userFromReview(review) {
                                Text("\(user.lastName ?? "") \(user.firstName ?? "")")
                                    .font(.system(size: 14,weight: .bold))
                            }
                            StarRatingView(rating: review.rating)
                        }
                        Spacer()
                        if let date = review.createdAt.convertToDate() {
                            Text(date.label())
                                .font(.system(size: 14, weight: .bold))
                        }
                    }
                    Text(review.content)
                        .font(.system(size: 14, weight: .regular))
                }
                .padding(.horizontal)
            }
        }
}
