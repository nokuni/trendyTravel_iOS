//
//  CategoryDetailView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 18/07/2023.
//

import SwiftUI

struct CategoryDetailView: View {
    @EnvironmentObject var activityVM: ActivityViewModel
    let category: Activity.Category
    var body: some View {
        ScrollView {
            ForEach(activityVM.particularActivities(category: category), id: \.self) { activity in
                CategoryDetailCardView(activity: activity)
                    .navigationBarTitle(activity.category.rawValue.capitalized, displayMode: .inline)
            }
        }
    }
}

struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryDetailView(category: .bar)
                .environmentObject(ActivityViewModel())
        }
    }
}
