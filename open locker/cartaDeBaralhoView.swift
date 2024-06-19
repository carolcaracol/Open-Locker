//
//  cartaDeBaralhoView.swift
//  open locker
//
//  Created by Ana Carolyne Alves Costa on 19/06/24.
//

import SwiftUI

struct cartaDeBaralhoView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundStyle(.branco)
                
                .clipShape(.rect(cornerRadius: 10))
                .shadow(radius: 4, y: 4)
            
            ZStack(alignment: .topLeading) {
                Image(systemName: "heart")
                    .foregroundStyle(.rosa)
                    
                
                ZStack(alignment: .bottomTrailing) {
                    Image(systemName: "heart")
                        .foregroundStyle(.rosa)
                    ZStack {
                        HStack {
                            Rectangle()
                                .frame(width: 2)
                                .padding(.top )
                            Spacer()
                            Rectangle()
                                .frame(width: 2)
                                .padding(.bottom)
                        }
                        VStack {
                            Rectangle()
                                .frame(height: 2)
                                .padding(.leading)
                            Spacer()
                            Rectangle()
                                .frame(height: 2)
                                .padding(.trailing)
                        }
                    }
                    .padding(8)
                }
            }
            .padding(8)
            
        }
        .frame(width: 153.07, height: 239.63)
    }
}

#Preview {
    cartaDeBaralhoView()
}
