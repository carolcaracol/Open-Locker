//
//  TabPremios.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 27/06/24.
//

import SwiftUI

struct TabPremios: View {
    var body: some View {
        ZStack{
            Image(.fichaPremios)
//                        .resizable()
                .scaledToFit()
//                        .frame(width: 130, height: 55)
            
            VStack(alignment: .center ,spacing: 2) {
                    Image(.trofeuIcon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 21, height: 21)
                    
                    Text("prêmios")
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TabPremios()
}
