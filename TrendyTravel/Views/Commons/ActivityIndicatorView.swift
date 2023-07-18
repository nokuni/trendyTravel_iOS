//
//  ActivityIndicatorView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 18/07/2023.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    typealias UIViewType = UIActivityIndicatorView
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        aiv.color = .white
        return aiv
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
    }
}
