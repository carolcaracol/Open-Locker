//
//  ContentView.swift
//  open locker
//
//  Created by Ana Carolyne Alves Costa on 18/06/24.
//

import SwiftUI

struct SorteioView: View {
    var body: some View {
<<<<<<< HEAD:open locker/SorteioView.swift
        VStack {
            Text("sorteio")
                .foregroundStyle(.purple)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
            
            Rectangle()
                .foregroundColor(.purple)
                .frame(width: 353, height: 10)
            
            Image(.baralhoRosa)
                .padding(76)
            
            Button(
                action: {},
                label: {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.green)
                            .border(Color.white)
                        
                        Text("SORTEAR")
                            .foregroundStyle(.black)
                            .bold()
                            .font(.subheadline)
                        
                        
                    }
                }
            )
            .cornerRadius(12)
            .frame(width: 147,height: 49)
            
        }
        .padding()
        
        
=======
        
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
             
               
                NavBar()
                    .padding(.bottom, -80)
                
                Rectangle()
                    .ignoresSafeArea()
                    .frame(height: 30)
                    .foregroundColor(.roxo)
               
                
            }

>>>>>>> navBar:open locker/Views/SorteioView.swift
    }
    
}

#Preview {
    SorteioView()
}
