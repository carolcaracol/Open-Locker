//
//  TabGaleria.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 27/06/24.
//

import SwiftUI

struct TabGaleria: View {
    var body: some View {
        ZStack {
            Image(.fichaGaleria)
//                        .resizable()
                .scaledToFit()
//                        .frame(width: 140, height: 55)
             
            
            VStack(alignment: .center , spacing: 2) {
                    Image(.galeriaIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 18)
                    
                    Text("galeria")
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TabGaleria()
}
