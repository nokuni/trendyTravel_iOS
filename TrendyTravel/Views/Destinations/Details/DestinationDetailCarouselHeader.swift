//
//  DestinationDetailCarouselHeader.swift
//  TrendyTravel
//
//  Created by Julie Collazos on 26/06/2023.
//

import SwiftUI

struct DestinationDetailCarouselHeader: View {
    @State private var index = 0
    var images: [String]
    var body: some View {
        VStack {
            TabView(selection: $index) {
                ForEach((0..<images.count), id: \.self) { index in
                    image(index: index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
            HStack(spacing: 2) {
                ForEach((0..<3), id: \.self) { index in
                    Rectangle()
                        .fill(index == self.index ? Color.cyan : Color.cyan.opacity(0.5))
                        .frame(width: 30, height: 5)
                }
            }
            .padding()
        }
    }
    
    @ViewBuilder
    private func image(index: Int) -> some View {
        Image(images[index])
            .resizable()
            .scaledToFill()
    }
}

struct DestinationDetailCarouselHeader_Previews: PreviewProvider {
    static let attractionsImages: [String] = [
        .init("eiffel_tower"),
        .init("new_york"),
        .init("art2"),
        .init("art1")
    ]
    
    static var previews: some View {
        DestinationDetailCarouselHeader(images: attractionsImages)
            .frame(height: 300)
    }
}
