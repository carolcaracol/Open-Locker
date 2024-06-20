//
//  HomePrincipal.swift
//  open locker
//
//  Created by João Mateus Gonçalves da Silva on 20/06/24.
//

import SwiftUI

struct HomePrincipal: View {
    var body: some View {
            VStack {
                ZStack {
                    VStack {
                        Rectangle()
                            .foregroundColor(.roxo)
                            .frame(height: 180)
                            .ignoresSafeArea()
                    }
                    VStack {
                        Text("tipos")
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .foregroundColor(.white)
                    }
                    
                }
                Spacer()
                HStack {
                    Text("escolha!")
                        .font(.title)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.roxo)
                        .padding(.trailing, 225)
                }
                VStack {
                    Rectangle()
                        .frame(width: 185, height: 3) // Altura da linha
                        .foregroundColor(.black)
                        .padding(.trailing, 165)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    RoundedRectangle(cornerRadius: 10)
                        .frame (width: 358, height: 551)
                        .foregroundColor(.clear)
                        .border(.black, width: 6)
                    
                }
                
                
            
        }
    }
}

#Preview {
    HomePrincipal()
}

