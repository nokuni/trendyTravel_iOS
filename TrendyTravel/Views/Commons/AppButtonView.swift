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
    var padding: Edge.Set
    var paddingValue: CGFloat
    var action: (() -> Void)?
    
    init(label: String,
         labelColor: Color,
         backgroundColor: Color,
         padding: Edge.Set = .all,
         paddingValue: CGFloat = 16,
         action: (() -> Void)? = nil) {
        self.label = label
        self.labelColor = labelColor
        self.backgroundColor = backgroundColor
        self.padding = padding
        self.paddingValue = paddingValue
        self.action = action
    }
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
        .padding(padding, paddingValue)
    }
}
