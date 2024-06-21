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
                        Text("um estilo para aprimorar seus desenhos. Ao selecionar um estilo, você será conectado a um desafio personalizado. Faça o registro de seus resultados para ter a chance de ganhar um prêmio surpresa.")
                            .font(.caption)
                            .padding(.leading, 38)
                            .padding(.trailing, 60)
                            .padding(.bottom, 30)
                        Image(.chindogubotao)
                        Image(.formasbotao)
                        Image(.cenasbotao)
                        Image(.crazybotao)
                            .padding(.bottom, 30)
                    }
                    
                    
                }
                
                
                Rectangle()
                    .frame(width: 393, height: 81)
            }
            //mudar para toolbar item para mandar para o centro
            .navigationTitle("tipos")
            .font(.system(size:16))
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(.roxo, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar, .tabBar)
            
            
        }
    }
}


#Preview {
    HomePrincipal()
}

