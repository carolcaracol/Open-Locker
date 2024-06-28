//
//  ContentView.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 28/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    NavigationLink(destination: RandomShapesView(onImageSaved: saveImage)) {
                        Image("Group 49")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }

                    NavigationLink(destination: BingoView(onImageSaved: saveImage)) {
                        Image("Group 50")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }

                    NavigationLink(destination: GalleryView()) {
                        VStack {
                            Image("Rectangle 152")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 100)
                            Image("icone")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30, height: 30)
                                .offset(y: -30)
                        }
                    }
                }

                HStack(spacing: 20) {
                    NavigationLink(destination: CardView(onImageSaved: saveImage)) {
                        Image("Group 51")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }

                    NavigationLink(destination: NewFrameView(onImageSaved: saveImage)) {
                        Image("Frame 7")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }

                    NavigationLink(destination: NotebookView()) {
                        Image("Rectangle 141")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                }
            }
            .padding()
            .background(Color.white)
            .navigationBarHidden(true)
        }
    }
    
    func saveImage(image: UIImage, source: ImageSource) {
        if let url = FileManager.saveImage(image) {
            var savedImages = UserDefaults.standard.getSavedImagePaths()
            if !savedImages.contains(url) {
                savedImages.append(url)
                UserDefaults.standard.saveImagePaths(savedImages.map { $0.absoluteString })
               
                var imageSources = UserDefaults.standard.getImageSources()
                imageSources.append(source.rawValue)
                UserDefaults.standard.saveImageSources(imageSources)
                
                addImageToGallery(image: image, url: url, source: source)
            }
        }
    }

    func addImageToGallery(image: UIImage, url: URL, source: ImageSource) {
        var galleryImages = getGalleryImages()
        if !galleryImages.contains(where: { $0.url == url }) {
            let newImage = GalleryImage(image: image, url: url, source: source)
            galleryImages.append(newImage)
            saveImageToDefaults(galleryImages: galleryImages)
        }
    }

    func getGalleryImages() -> [GalleryImage] {
        let urls = UserDefaults.standard.getSavedImagePaths()
        let sources = UserDefaults.standard.getImageSources()

        return urls.enumerated().compactMap { (index, url) in
            if let image = FileManager.loadImage(at: url) {
               return GalleryImage(image: image, url: url, source: ImageSource(rawValue: sources[index]) ?? .gallery)
            }
            return nil
        }
    }

    func saveImageToDefaults(galleryImages: [GalleryImage]) {
        let imagePaths = galleryImages.map { $0.url.absoluteString }
        UserDefaults.standard.saveImagePaths(imagePaths)

        let imageSources = galleryImages.map { $0.source.rawValue }
        UserDefaults.standard.saveImageSources(imageSources)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


