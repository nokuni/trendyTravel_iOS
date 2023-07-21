//
//  ImageURLView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 18/07/2023.
//

import SwiftUI

struct ImageURLView: View {
    var image: String?
    var body: some View {
        if let image = image,
           let url = URL(string: image) {
            AsyncImage(url: url) { phase in
                if let image = phase.image {
                    image.resizable()
                } else if phase.error != nil {
                    Color.blue
                } else {
                    ProgressView()
                }
            }
        }
    }
}

struct ImageURLView_Previews: PreviewProvider {
    static var previews: some View {
        ImageURLView()
    }
}
