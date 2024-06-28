//
//  CardView.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 28/06/24.
//

import SwiftUI

struct CardView: View {
    @State private var showAnimation = false
    @State private var showCardImages = false
    @State private var cardImages: [String] = []
    @State private var isShowingImagePicker = false
    var onImageSaved: (UIImage, ImageSource) -> Void

    var body: some View {
        VStack {
            if showAnimation {
                Text("Animação")
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showCardImages = true
                                showAnimation = false
                            }
                        }
                    }
            } else if showCardImages {
                HStack(spacing: 20) {
                    ForEach(cardImages, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .rotationEffect(Angle(degrees: imageName == cardImages.first ? -10 : 10))
                    }
                }
                .transition(.opacity)
                .offset(y: 170)
            } else {
                VStack {
                    Image("baralho color")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 320, height: 320)
                        .offset(y: 130)

                    Button(action: {
                        withAnimation {
                            showAnimation = true
                            generateCardImages()
                        }
                    }) {
                        Image("Group 26")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            .padding(.top, 130)
                    }
                }
            }

            Spacer()

            HStack {
                Button(action: {
                    isShowingImagePicker = true
                }) {
                    Image("camera3")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .offset(y: -40)
                }

                Button(action: {
                    withAnimation {
                        showCardImages = false
                        showAnimation = false
                    }
                }) {
                    ZStack {
                        Image("Group 112")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .offset(y: -40)

                        Image("symbol")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .offset(y: -43)
                    }
                }
            }
        }
        .sheet(isPresented: $isShowingImagePicker, content: {
            ImagePicker(isPresented: $isShowingImagePicker, selectedImage: .constant(nil), onImagePicked: { image in
                onImageSaved(image, .cardView)
            })
        })
    }

    func generateCardImages() {
        var images = ["Dragao", "Unicórnio", "Raposa", "Sereia", "Fada", "Guaxinim", "Morcego", "Ourico", "Ornitorrinco", "Axolotl", "Fusca", "Ioio", "Camiseta", "Mochila", "Panela", "Medo", "Feliz", "Tédio", "Raiva", "Triste"]
        images.shuffle()

        var nonEmotionImages = images.filter { !["Medo", "Feliz", "Tédio", "Raiva", "Triste"].contains($0) }
        let emotionImages = images.filter { ["Medo", "Feliz", "Tédio", "Raiva", "Triste"].contains($0) }

        cardImages.removeAll()
        if let firstNonEmotion = nonEmotionImages.first {
            cardImages.append(firstNonEmotion)
            nonEmotionImages.removeFirst()
        }

        if let secondImage = nonEmotionImages.first ?? emotionImages.first {
            cardImages.append(secondImage)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(onImageSaved: { _, _ in })
    }
}





//
//#Preview {
//    CardView()
//}
