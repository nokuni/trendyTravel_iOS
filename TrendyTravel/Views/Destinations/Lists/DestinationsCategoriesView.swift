//
//  DestinationsCategoriesView.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 26/06/2023.
//

import SwiftUI

struct DestinationsCategoriesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach(Activity.Category.allCases, id: \.self) { category in
                    NavigationLink {
                        CategoryDetailView(category: category)
                    } label: {
                        DestinationsCategoriesImageAndLabelView(category: category)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct DestinationsCategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ZStack {
                Color.cyan
                DestinationsCategoriesView()
            }
        }
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}

