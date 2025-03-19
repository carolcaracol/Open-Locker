//
//  TrashView.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 28/06/24.
//

import SwiftUI

struct TrashView: View {
    @Binding var deletedImages: [GalleryImage]
    var onRestore: (GalleryImage) -> Void

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                        .padding()
                }
                Spacer()
                Text("Lixeira")
                    .font(.largeTitle)
                    .padding()
                Spacer()
            }

            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(deletedImages) { galleryImage in
                        VStack {
                            ZStack {
                                Image(galleryImage.frameImageName())
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 150)

                                Image(uiImage: galleryImage.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 77.5, height: 97)
                                    .cornerRadius(3)
                                    .clipped()
                                    .offset(y: -4.1)

                                VStack {
                                    Spacer()
                                    Text(galleryImage.dateFormatted())
                                        .font(.custom("Ubuntu-Regular", size: 12))
                                        .foregroundColor(.black)
                                        .padding(.bottom, 5)
                                }
                            }
                            HStack {
                                Button(action: {
                                    restoreImage(galleryImage)
                                }) {
                                    Image(systemName: "arrow.uturn.left")
                                        .foregroundColor(.blue)
                                }
                                Button(action: {
                                    permanentlyDeleteImage(galleryImage)
                                }) {
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.top, 10)
                        }
                    }
                }
                .padding()
            }
        }
    }

    func restoreImage(_ galleryImage: GalleryImage) {
        deletedImages.removeAll { $0.id == galleryImage.id }
        onRestore(galleryImage)
        saveDeletedImages(deletedImages)
    }

    func permanentlyDeleteImage(_ galleryImage: GalleryImage) {
        deletedImages.removeAll { $0.id == galleryImage.id }
        try? FileManager.default.removeItem(at: galleryImage.url)
        saveDeletedImages(deletedImages)
    }

    func saveDeletedImages(_ deletedImages: [GalleryImage]) {
        UserDefaults.standard.saveDeletedImages(deletedImages)
    }
}

struct TrashView_Previews: PreviewProvider {
    static var previews: some View {
        TrashView(deletedImages: .constant([]), onRestore: { _ in })
    }
}

//
//#Preview {
//    TrashView()
//}
