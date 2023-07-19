//
//  DestinationsCategoriesView.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 26/06/2023.
//

import SwiftUI

struct DestinationsCategoriesView: View {
    let categories: [Category] = [
        .init(name: L10n.DestinationsCategoriesView.culture, imageName: "books.vertical.fill"),
        .init(name: L10n.DestinationsCategoriesView.show, imageName: "music.mic"),
        .init(name: L10n.DestinationsCategoriesView.sports, imageName: "sportscourt.fill"),
        .init(name: L10n.DestinationsCategoriesView.restaurant, imageName: "fork.knife"),
        .init(name: L10n.DestinationsCategoriesView.bar, imageName: "wineglass.fill"),
    ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 14) {
                ForEach(categories, id: \.self) { category in
                    NavigationLink {
                        // TODO: fix link
//                        CategoryDetailView(destination: destination)
                    } label: {
                        DestinationsCategoriesImageAndLabelView(
                            image: category.imageName,
                            title: category.name
                        )
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

