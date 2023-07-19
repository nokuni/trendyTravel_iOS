//
//  SearchBarView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI
import Utility_Toolbox

struct SearchBarView: View {
    var prompt: String
    var focusField: FocusState<FocusField?>.Binding
    @Binding var text: String

    var body: some View {
        SearchBar(text: $text,
                  prompt: prompt,
                  backgroundPadding: 10,
                  focusField: focusField,
                  icon: {
            Image(sfObjectsAndTools: .magnifyingGlass)
                .foregroundColor(.aluminium)
        })
        .focused(focusField, equals: .search)
        .padding()
    }
}
