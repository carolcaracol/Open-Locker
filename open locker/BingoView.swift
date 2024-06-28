//
//  BingoView.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 28/06/24.
//

import SwiftUI

struct BingoView: View {
    @State private var timerCount = 0
    @State private var currentImage: UIImage? = UIImage(named: "placeholder")
    @State private var isShowingImagePicker = false
    @State private var markedSquares: [Bool] = Array(repeating: false, count: 8)
    @State private var timer: Timer?
    @State private var xOffset: CGFloat = 16
    @State private var yOffset: CGFloat = 79.5

    let images = ["image1", "image2", "image3"]
    let timerInterval: TimeInterval = 60
    var onImageSaved: (UIImage, ImageSource) -> Void

    var body: some View {
        VStack {
            GeometryReader { geometry in
                ZStack {
                    Image("Bingo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width, height: geometry.size.height)

                    if let currentImage = currentImage {
                        Image(uiImage: currentImage)
                            .resizable()
                            .frame(width: 1.065 * 540 / 768 * geometry.size.width, height: 1.06 * 306 / 768 * geometry.size.width)
                            .position(x: geometry.size.width * (414 / 768) + xOffset, y: geometry.size.height * (243 / 1024) + yOffset)
                            .clipped()
                    }

                    ForEach(0..<8) { index in
                        let (x, y) = self.positionForSquare(index: index, geometry: geometry)
                        SquareView(index: index, isMarked: $markedSquares[index])
                            .frame(width: 121 / 768 * geometry.size.width, height: 116 / 768 * geometry.size.width)
                            .position(x: x, y: y)
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .frame(height: 600)
            .padding()

            if timerCount < 8 * Int(timerInterval) {
                HStack {
                    Image(systemName: "clock")
                    Text("Time: \(Int(timerInterval) - (timerCount % Int(timerInterval))) seconds")
                        .font(.title)
                }
                .padding(.top, -70)
                .onAppear {
                    startTimer()
                }
            }

            HStack {
                Button(action: {
                    resetTimer()
                    showRandomImage()
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

                if timerCount >= 8 * Int(timerInterval) {
                    Button(action: {
                        isShowingImagePicker = true
                    }) {
                        Image("camera")
                            .resizable()
                            .frame(width: 60, height: 60)
                    }
                    .padding(.top, -70)
                }
            }
        }
        .background(Color.white)
        .sheet(isPresented: $isShowingImagePicker, content: {
            ImagePicker(isPresented: $isShowingImagePicker, selectedImage: .constant(nil), onImagePicked: { image in
                onImageSaved(image, .bingo)
            })
        })
        .onAppear {
            showRandomImage()
        }
    }

    func positionForSquare(index: Int, geometry: GeometryProxy) -> (CGFloat, CGFloat) {
        let xOffset: CGFloat
        let yOffset: CGFloat

        switch index {
        case 0:
            xOffset = 221
            yOffset = 591.5
        case 1:
            xOffset = 375.5
            yOffset = 591.5
        case 2:
            xOffset = 525
            yOffset = 591.5
        case 3:
            xOffset = 674
            yOffset = 591.5
        case 4:
            xOffset = 226.5
            yOffset = 730.5
        case 5:
            xOffset = 375.5
            yOffset = 730.5
        case 6:
            xOffset = 525
            yOffset = 730.5
        case 7:
            xOffset = 674
            yOffset = 730.5
        default:
            xOffset = 0
            yOffset = 0
        }

        let x = geometry.size.width * (xOffset / 768)
        let y = geometry.size.height * (yOffset / 1024)
        return (x, y)
    }

    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if timerCount < 8 * Int(timerInterval) {
                timerCount += 1
                if timerCount % Int(timerInterval) == 0 {
                    markSquare()
                }
            } else {
                timer.invalidate()
                self.timer = nil
            }
        }
    }
    
    func resetTimer() {
        timer?.invalidate()
        timerCount = 0
        startTimer()
    }

    func showRandomImage() {
        let randomIndex = Int.random(in: 0..<images.count)
        if let randomImage = UIImage(named: images[randomIndex]) {
            currentImage = randomImage
        }
    }

    func markSquare() {
        let index = timerCount / Int(timerInterval) - 1
        if index >= 0 && index < markedSquares.count {
            markedSquares[index] = true
        }
    }
}

struct BingoView_Previews: PreviewProvider {
    static var previews: some View {
        BingoView(onImageSaved: { _, _ in })
    }
}





//#Preview {
//    BingoView()
//}
