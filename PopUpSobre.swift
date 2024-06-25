//
//  PopUpSobre.swift
//  open locker
//
//  Created by João Mateus Gonçalves da Silva on 25/06/24.
//

import SwiftUI

struct PopupSobre: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        if !isPresented {
            EmptyView()
        } else {
            ZStack{
                Button {
                    isPresented = false
                } label: {
                    Color.roxo
                        .ignoresSafeArea(.all)
                }
                Image("popupSobre")
                    .resizable()
                    .scaledToFit()
            }
        }
    }
}

#Preview {
    PopupSobre(isPresented: .constant(true))
}
