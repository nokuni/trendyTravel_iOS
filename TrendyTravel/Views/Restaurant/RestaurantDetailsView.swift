//
//  RestaurantDetailsView.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 29/06/2023.
//

import SwiftUI


struct RestaurantDetailsView: View {
    var activity: Activity
    var reviews: [Review]
    var body: some View{
        ScrollView {
            ZStack(alignment: .bottomLeading) {
                Image(activity.imageName)
                    .resizable()
                    .scaledToFill()
                
                LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(activity.name)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                        HStack {
                            ForEach(0..<5, id: \.self) { _ in
                                Image(systemName: "star.fill")
                            }
                            .foregroundColor(.orange)
                        }
                    }
                    Spacer()
                }
                .padding()
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(L10n.RestaurantDetailsView.title)
                    .font(.system(size: 16, weight: .bold))
                Text(L10n.RestaurantDetailsView.name)
                HStack {
                    ForEach(0..<5, id: \.self) { _ in
                        Image(systemName: "dollarsign.circle.fill")
                    }
                    .foregroundColor(.orange)
                }
                HStack { Spacer() }
            }
            .padding(.top)
            .padding(.horizontal)
            Text(activity.description)
                .padding(.top, 8)
                .font(.system(size: 14, weight: .regular))
                .padding(.horizontal)
                .padding(.bottom)
            Divider()
                .padding(.horizontal)
            ReviewList(reviews: reviews)
                .padding(.top)
        }
        .navigationBarTitle(L10n.RestaurantDetailsView.navigationBar_title, displayMode: .inline)
    }
}

struct RestaurantDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RestaurantDetailsView(activity: Activity.example, reviews: [])
        }
    }
}
