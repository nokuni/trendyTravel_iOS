//
//  PhotoSelectionView.swift
//  TrendyTravel
//
//  Created by Yann Christophe Maertens on 20/07/2023.
//

import SwiftUI
import PhotosUI
import Utility_Toolbox

struct PhotoSelectionView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @Binding var selectedImageData: Data?
    
    var body: some View {
        VStack {
            PhotosPicker(
                selection: $selectedItem,
                matching: .images,
                photoLibrary: .shared()) {
                    if let selectedImageData,
                       let uiImage = UIImage(data: selectedImageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
                    } else {
                        Circle()
                            .foregroundColor(.accentColor)
                            .frame(width: 100, height: 100)
                            .overlay(
                                Image(systemName: "plus")
                                    .font(.system(.largeTitle, design: .default, weight: .bold))
                                    .foregroundColor(.background)
                            )
                    }
                }
                .onChange(of: selectedItem) { newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                        }
                    }
                }
            Text("Add your photo")
                .foregroundColor(.tin)
        }
    }
}

struct PhotoSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoSelectionView(selectedImageData: .constant(nil))
    }
}
