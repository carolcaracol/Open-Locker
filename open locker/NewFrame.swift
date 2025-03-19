//
//  NewFrame.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 28/06/24.
//

import SwiftUI

struct NewFrameView: View {
    @State private var showAnimation = false
    @State private var showCardImage = false
    @State private var cardImageName: String = ""
    @State private var isShowingImagePicker = false
    var onImageSaved: (UIImage, ImageSource) -> Void

    var body: some View {
        VStack {
            if showAnimation {
                Text("Animação")
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                showCardImage = true
                                showAnimation = false
                                cardImageName = getRandomCardImageName()
                            }
                        }
                    }
            } else if showCardImage {
                VStack {
                    Image(cardImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(Angle(degrees: -8))
                        .offset(y: 170)
                    Spacer()

                    HStack {
                        Button(action: {
                            isShowingImagePicker = true
                        }) {
                            Image("camera4")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .offset(y: -40)
                        }

                        Button(action: {
                            withAnimation {
                                showCardImage = false
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
            } else {
                VStack {
                    Image("baralho azul")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 320, height: 320)
                        .offset(y: 130)
                    
                    Button(action: {
                        withAnimation {
                            showAnimation = true
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
        }
        .sheet(isPresented: $isShowingImagePicker, content: {
            ImagePicker(isPresented: $isShowingImagePicker, selectedImage: .constant(nil), onImagePicked: { image in
                onImageSaved(image, .newFrameView)
            })
        })
    }

    func getRandomCardImageName() -> String {
        let images = ["Cena 1", "Cena 2", "Cena 3", "Cena 4", "Cena 5", "Cena 6", "Cena 7", "Cena 8", "Cena 9", "Cena 10"]
        return images.randomElement() ?? "Cena 1"
    }
}

struct NewFrameView_Previews: PreviewProvider {
    static var previews: some View {
        NewFrameView(onImageSaved: { _, _ in })
    }
}



//
//
//#Preview {
//    NewFrame()
//}
