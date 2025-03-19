//
//  NoteBookView.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 28/06/24.
//

import SwiftUI

struct NotebookView: View {
    @State private var stickers: [String] = UserDefaults.standard.getStickers()
    @State private var notebookImage = UIImage(named: "Group 89")

    var body: some View {
        VStack {
            ZStack {
                if let notebookImage = notebookImage {
                    Image(uiImage: notebookImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 380, height: 480)
                }

                ForEach(stickers, id: \.self) { stickerName in
                    Image(stickerName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: sizeForSticker(stickerName: stickerName).width, height: sizeForSticker(stickerName: stickerName).height)
                        .position(positionForSticker(stickerName: stickerName))
                }
            }
        }
        .onAppear {
            stickers = UserDefaults.standard.getStickers()
        }
    }

    func positionForSticker(stickerName: String) -> CGPoint {
        switch stickerName {
        case "Group 97":
            return CGPoint(x: 130, y: 190)
        case "Group 100":
            return CGPoint(x: 270, y: 190)
        case "Group 95":
            return CGPoint(x: 110, y: 300)
        case "Group 96":
            return CGPoint(x: 300, y: 340)
        case "Diamond":
            return CGPoint(x: 170, y: 430)
        case "Skull":
            return CGPoint(x: 120, y: 520)
        case "Group 98":
            return CGPoint(x: 290, y: 500)
        default:
            return CGPoint(x: 100, y: 150)
        }
    }

    func sizeForSticker(stickerName: String) -> CGSize {
        switch stickerName {
        case "Group 97":
            return CGSize(width: 130, height: 130)
        case "Group 100":
            return CGSize(width: 120, height: 120)
        case "Group 95":
            return CGSize(width: 90, height: 90)
        case "Group 96":
            return CGSize(width: 80, height: 80)
        case "Diamond":
            return CGSize(width: 90, height: 90)
        case "Skull":
            return CGSize(width: 80, height: 80)
        case "Group 98":
            return CGSize(width: 110, height: 110)
        default:
            return CGSize(width: 50, height: 50)
        }
    }
}

struct NotebookView_Previews: PreviewProvider {
    static var previews: some View {
        NotebookView()
    }
}





//
//#Preview {
//    NoteBookView()
//}
