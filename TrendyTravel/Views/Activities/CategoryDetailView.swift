//
//  CategoryDetailView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 18/07/2023.
//

import SwiftUI

struct CategoryDetailView: View {
    let name: String
    @EnvironmentObject var vm: CategoryDetailsViewModel
    
    var body: some View {
        if vm.isLoading {
            CategoryDetailLoadingView()
        } else {
            ZStack {
                if !vm.errorMessage.isEmpty {
                    CategoryDetailErrorView(errorMessage: vm.errorMessage)
                }
                ScrollView {
                    ForEach(vm.activities, id: \.self) { activity in
                        CategoryDetailCardView(activity: activity)
                            .navigationBarTitle(activity.category.rawValue.capitalized, displayMode: .inline)
                    }
                }
            }
            
        }
    }
}

private struct CategoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CategoryDetailView(name: "culture")
                .environmentObject(CategoryDetailsViewModel())
        }
    }
}
