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
                    Spacer()
                        .frame(height: 20)
                    ZStack {
                        VStack {
                            Rectangle()
                                .frame(width: 358, height: 551)
                                .foregroundColor(.black)                                .clipShape(.rect(cornerRadius: 20.0).stroke(lineWidth: 4.0))
//                                .cornerRadius(20.0)
                                .padding(.bottom, 100)
                        }
                        VStack {
                            Text("escolha!")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.roxo)
                                .padding(.trailing, 200)
                                .padding(.bottom, -1)
                            Rectangle()
                                .frame(width: 185, height: 3) // Altura da linha
                                .foregroundColor(.black)
                                .padding(.trailing, 125)
                                .padding(.bottom, 490)
                        }
                        
                    }
                }
                
                
            
        }
    }


#Preview {
    HomePrincipal()
}

