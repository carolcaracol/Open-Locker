//
//  FormasView.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 28/06/24.
//

import SwiftUI

struct RandomShapesView: View {
    @State private var currentShape: UIImage? = UIImage(named: "forma1")
    @State private var isShowingImagePicker = false

    let shapes = ["forma1", "forma2", "forma3", "forma4", "forma5", "forma6", "forma7", "forma8", "forma9", "forma10"]
    var onImageSaved: (UIImage, ImageSource) -> Void

    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Image("Group 43")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 400, height: 400)

                if let currentShape = currentShape {
                    Image(uiImage: currentShape)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                        .position(x: 200, y: 340)
                }
            }
            Spacer()

            HStack {
                Button(action: {
                    isShowingImagePicker = true
                }) {
                    Image("camera2")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .offset(y: -40)
                }

                Button(action: {
                    showRandomShape()
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
                onImageSaved(image, .randomShapes)
            })
        })
        .onAppear {
            showRandomShape()
        }
    }

    func showRandomShape() {
        let randomIndex = Int.random(in: 0..<shapes.count)
        currentShape = UIImage(named: shapes[randomIndex])
    }
}

struct RandomShapesView_Previews: PreviewProvider {
    static var previews: some View {
        RandomShapesView(onImageSaved: { _, _ in })
    }
}



