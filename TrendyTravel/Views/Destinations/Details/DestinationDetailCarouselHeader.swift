//
//  DestinationDetailCarouselHeader.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 26/06/2023.
//

import SwiftUI
import Utility_Toolbox

struct DestinationDetailCarouselHeader: View {
    @Binding var selectedIndex: Int
    var images: [String]
    var body: some View {
        VStack {
            if images.isNotEmpty {
                carousel()
                carouselIndicators()
            } else {
                Text("There is no activities yet")
                    .font(.title)
                    .foregroundColor(.tin)
            }
        }
    }
    
    @ViewBuilder
    private func image(index: Int) -> some View {
        ImageURLView(image: images[index])
            .scaledToFill()
    }
    
    @ViewBuilder
    private func carousel() -> some View {
        TabView(selection: $selectedIndex) {
            ForEach((0..<images.count), id: \.self) { index in
                image(index: index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
    
    @ViewBuilder
    private func carouselIndicators() -> some View {
        HStack(spacing: 2) {
            ForEach((0..<images.count), id: \.self) { index in
                Rectangle()
                    .fill(index == selectedIndex ? Color.cyan : Color.cyan.opacity(0.5))
                    .frame(width: 30, height: 5)
            }
        }
        .padding()
    }
}

struct DestinationDetailCarouselHeader_Previews: PreviewProvider {
    static var previews: some View {
        DestinationDetailCarouselHeader(selectedIndex: .constant(0), images: [])
    }
}
