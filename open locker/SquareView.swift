//
//  SquareView.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 28/06/24.
//

import SwiftUI

struct SquareView: View {
    let index: Int
    @Binding var isMarked: Bool

    var body: some View

    {
        ZStack {
            Rectangle()
                .stroke(lineWidth: 2)
            if isMarked {
                Text("X")
                    .font(.system(size: 45))
                    .foregroundColor(.red)
                    .fontWeight(.bold)
            }
        }
    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView(index: 0, isMarked: .constant(false))
    }
}



//
//#Preview {
//    SquareView()
//}
