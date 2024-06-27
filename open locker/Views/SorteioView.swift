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
                
                HStack {
                    Image(.sorteio)
                        .padding(.trailing, 140 )
                }
                .padding(-3)
                
                HStack {
                     Spacer()
                    Image(.separador)
                }
                    
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
                    }) .padding(.bottom, 30)
             
               
//                NavBar()
//                    .padding(.bottom, -80)
//                
//                Rectangle()
//                    .ignoresSafeArea()
//                    .frame(height: 30)
//                    .foregroundColor(.roxo)
               
                
            }

    }
}

#Preview {
    SorteioView()
}
