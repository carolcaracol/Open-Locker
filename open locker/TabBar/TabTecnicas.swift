//
//  TabTecnicas.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 27/06/24.
//

import SwiftUI

struct TabTecnicas: View {
    var body: some View {
        ZStack{
            
            Image(.fichaHome)
//                        .resizable()
                .scaledToFit()
//                        .frame(width: 130, height: 55)
              
            
            VStack(alignment: .center ,spacing: 2) {
                Image(.paletaIcon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 18)
                        
                        Text("tecnicas")
                    .foregroundColor(.white)
                    .bold()
        
            }
        }
    }
}

#Preview {
    TabTecnicas()
}
