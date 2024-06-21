//
//  ContentView.swift
//  open locker
//
//  Created by Ana Carolyne Alves Costa on 18/06/24.
//

import SwiftUI

struct SorteioView: View {
    var body: some View {
            VStack {
                
                Spacer()
                
                Text("sorteio")
                    .foregroundStyle(.roxo)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                   
                
                Image(.separador)
                    
                Image(.baralhoRosa)
                    .padding(76)
                
                Button(
                    action: {},
                    label: {
                        ZStack {
                            
                            Image(.botaoVerde)
                            
                            Text("SORTEAR")
                                .foregroundStyle(.black)
                                .bold()
                                .font(.subheadline)


                        }
                    })
//                .frame(width: 147,height: 49)
             
                Spacer()
               
                NavBar()
            }

    }
}

#Preview {
    SorteioView()
}