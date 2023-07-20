//
//  PhotoSelectionView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 20/07/2023.
//

import SwiftUI

import SwiftUI
import PhotosUI

struct PhotoSelectionView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    
    var body: some View {
        if let selectedImageData,
           let uiImage = UIImage(data: selectedImageData) {
            Image(uiImage: uiImage)
                .resizable()
                .clipShape(Circle())
                .frame(width: 150, height: 150)
        } else {
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()) {
                    Circle()
                        .frame(width: 150, height: 150)
                }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                        }
                    }
                }
        }
    }
}

struct PhotoSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoSelectionView()
    }
}
