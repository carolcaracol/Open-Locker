//
//  GalleryView.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 28/06/24.
//

import SwiftUI

struct GalleryView: View {
    @State private var isShowingImagePicker = false
    @State private var galleryImages: [GalleryImage] = []
    @State private var selectedImage: GalleryImage?

    @State private var expandedImageYOffset: CGFloat = -4.1
    @State private var expandedImageFrame = CGSize(width: 234, height: 294)

    @State private var deletedImages: [GalleryImage] = []
    @State private var showingTrash = false

    @State private var thumbnailDateFontSize: CGFloat = 12
    @State private var thumbnailDateYOffset: CGFloat = 5
    @State private var expandedDateFontSize: CGFloat = 18
    @State private var expandedDateYOffset: CGFloat = 20

    var body: some View {
        VStack {
            Text("Galeria")
                .font(.largeTitle)
                .padding()

            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(galleryImages) { galleryImage in
                        VStack {
                            ZStack {
                                Image(galleryImage.frameImageName())
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100, height: 150)

                                Image(uiImage: galleryImage.image)
                                    .resizable()
                                    .aspectRatio(contentMode:

                                    .fill)
                                    .frame(width: 77.5, height: 97)
                                    .cornerRadius(3)
                                    .clipped()
                                    .offset(y: -4.1)

                                VStack {
                                    Spacer()
                                    Text(galleryImage.dateFormatted())
                                        .font(.custom("Ubuntu-Regular", size: thumbnailDateFontSize))
                                        .foregroundColor(.black)
                                        .padding(.bottom, thumbnailDateYOffset)
                                }
                            }
                            Button(action: {
                                deleteImage(galleryImage)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                            .padding(.top, 5)
                        }
                        .onTapGesture {
                            selectedImage = galleryImage
                        }
                    }
                }
                .padding()

                Button(action: {
                    isShowingImagePicker = true
                }) {
                    VStack {
                        Image("Ellipse 5")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)

                        Image("Vector 43")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .offset(y: -53)
                    }
                }
                .padding()
            }

            Button(action: {
                showingTrash = true
            }) {
                Text("Lixeira")
                    .font(.title2)
                    .foregroundColor(.blue)
            }
            .padding()
        }
        .fullScreenCover(item: $selectedImage) { galleryImage in
            ZStack {
                Color.black.ignoresSafeArea()

                VStack {
                    ZStack {
                        Image(galleryImage.frameImageName())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 400, height: 450)

                        Image(uiImage: galleryImage.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: expandedImageFrame.width, height: expandedImageFrame.height)
                            .cornerRadius(12)
                            .clipped()
                            .offset(y: expandedImageYOffset)
                            .offset(y: -8)
                    }
                    .padding()

                    Spacer()

                    Text(galleryImage.dateFormatted())
                        .font(.custom("Ubuntu-Regular", size: expandedDateFontSize))
                        .foregroundColor(.white)
                        .padding(.bottom, expandedDateYOffset)
                }

                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            selectedImage = nil
                        }) {
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .padding()
                        }
                    }
                    Spacer()
                }
            }
        }
        .sheet(isPresented: $isShowingImagePicker, content: {
            ImagePicker(isPresented: $isShowingImagePicker, selectedImage: .constant(nil), onImagePicked: { image in
                if let url = FileManager.saveImage(image) {
                    let newImage = GalleryImage(image: image, url: url, source: .gallery)
                    galleryImages.append(newImage)
                    saveImageToDefaults(galleryImages: galleryImages)
                    updateStickers(galleryImages: galleryImages)
                }
            })
        })
        .fullScreenCover(isPresented: $showingTrash) {
            TrashView(deletedImages: $deletedImages) { restoredImage in
                galleryImages.append(restoredImage)
                saveImageToDefaults(galleryImages: galleryImages)
                saveDeletedImages(deletedImages)
            }
        }
        .onAppear {
            loadImagesFromDefaults()
            deletedImages = UserDefaults.standard.getDeletedImages()
        }
    }

    func deleteImage(_ galleryImage: GalleryImage) {
        galleryImages.removeAll { $0.id == galleryImage.id }
        deletedImages.append(galleryImage)
        saveImageToDefaults(galleryImages: galleryImages)
        saveDeletedImages(deletedImages)
    }

    func saveImageToDefaults(galleryImages: [GalleryImage]) {
        let imagePaths = galleryImages.map { $0.url.absoluteString }
        UserDefaults.standard.saveImagePaths(imagePaths)

        let imageSources = galleryImages.map { $0.source.rawValue }
        UserDefaults.standard.saveImageSources(imageSources)
    }

    func saveDeletedImages(_ deletedImages: [GalleryImage]) {
        UserDefaults.standard.saveDeletedImages(deletedImages)
    }

    func loadImagesFromDefaults() {
        let urls = UserDefaults.standard.getSavedImagePaths()
        let sources = UserDefaults.standard.getImageSources()

        galleryImages = urls.enumerated().compactMap { (index, url) in
            if let image = FileManager.loadImage(at: url) {
                return GalleryImage(image: image, url: url, source: ImageSource(rawValue: sources[index]) ?? .gallery)
            }
            return nil
        }
    }

    func updateStickers(galleryImages: [GalleryImage]) {
        let stickerImages = ["Group 97", "Group 100", "Group 95", "Group 96", "Diamond", "Skull", "Group 98"]
        var stickers = UserDefaults.standard.getStickers()
        
        let newStickerCount = galleryImages.count / 5
        if newStickerCount > stickers.count {
            stickers = Array(stickerImages.prefix(newStickerCount))
            UserDefaults.standard.saveStickers(stickers)
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}



//
//
//#Preview {
//    GalleryView()
//}
