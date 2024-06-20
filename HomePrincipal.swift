//
//  HomePrincipal.swift
//  open locker
//
//  Created by João Mateus Gonçalves da Silva on 20/06/24.
//

import SwiftUI

struct HomePrincipal: View {
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Spacer()
                    .frame(height: 20)
                ZStack {
                    VStack {
                        Rectangle()
                            .frame(width: 358, height: 551)
                            .foregroundColor(.black)                                .clipShape(.rect(cornerRadius: 20.0).stroke(lineWidth: 4.0))
                        //                                .cornerRadius(20.0)
                        //                                .padding(.bottom, 100)
                    }
                    VStack {
                        Text("escolha!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.roxo)
                            .padding(.trailing, 200)
                            .padding(.bottom, -1)
                            .padding(.top, 20)
                        Rectangle()
                            .frame(width: 185, height: 3) // Altura da linha
                            .foregroundColor(.black)
                            .padding(.trailing, 125)
                            .padding(.bottom, 490)
                    }
                    
                }
                Rectangle()
                    .frame(width: 393, height: 81)
            }
            .navigationTitle("tipos")
            .font(.system(size:16))
            .foregroundColor(.black)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.roxo, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar, .tabBar)
            
            
        }
    }
}


#Preview {
    HomePrincipal()
}

