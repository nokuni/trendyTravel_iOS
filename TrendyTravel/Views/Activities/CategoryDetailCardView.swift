//
//  CategoryDetailCardView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 18/07/2023.
//

import SwiftUI
import Utility_Toolbox

struct CategoryDetailCardView: View {
    let activity: Activity
    var destination: Destination {
        for destination in  DestinationViewModel().destinations {
            if   activity.destinationId == destination.id {
                return destination
            }
        }
        return self.destination
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(activity.name.capitalized)
                .font(.system(.title2, design: .default, weight: .bold))
            ImageURLView(image: activity.imageName)
                .cornerRadius(5)
                .frame(maxWidth: .infinity, maxHeight: CGSize.screen.height * 0.3)
        }
        .padding()
    }
}

struct CategoryDetailCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailCardView(activity: Activity.example)
    }
}
