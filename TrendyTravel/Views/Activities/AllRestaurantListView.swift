//
//  AllRestaurantListView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 18/07/2023.
//

import SwiftUI

struct AllRestaurantListView: View {
    @EnvironmentObject var activityVM: ActivityViewModel
    var body: some View {
        ForEach(activityVM.particularActivities(category: .restaurant), id: \.self) { restaurant in
            
        }
    }
}
