//
//  AppButtonView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 17/07/2023.
//

import SwiftUI
import Utility_Toolbox

struct AppButtonView: View {
    var label: String
    var labelColor: Color
    var backgroundColor: Color
    var action: (() -> Void)?
    var body: some View {
        Button {
            action?()
        } label: {
            Text(label)
                .font(.system(.body, design: .default, weight: .bold))
                .foregroundColor(labelColor)
                .frame(maxWidth: .infinity)
                .padding()
                .background(
                    backgroundColor
                        .cornerRadius(10)
                        .shadow(color: .silver, radius: 4)
                )
        }
        .padding()
    }
}
