//
//  CategoryDetailCardView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 18/07/2023.
//

import SwiftUI

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
        VStack(alignment: .leading, spacing: 0) {
            Image(activity.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(activity.name)
                .font(.system(size: 12, weight: .semibold))
                .padding()
        }
        .padding()
    }
}

struct CategoryDetailCardView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetailCardView(activity: Activity.example)
    }
}
