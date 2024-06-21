//
//  PlanoB.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 21/06/24.
//

import SwiftUI

struct PlanoB: View {
    var body: some View {
        HStack(spacing: 30){
            
            Button(
                action: {
                    // Mudar para home
                
            }, label: {
                    
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 6) {
                            Image(systemName: "house")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 18)
                            
                            Text("home")
            
                }
            })
            
            
            Button(
                action: {
                    // Mudar para galeria
                
            }, label: {
                
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 6) {
                        Image(systemName: "photo.on.rectangle.angled")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 18)
                        
                        Text("galeria")
                    }
                
            })
            
            Button(
                action: {
                    // Mudar para home
                
            }, label: {
               
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 6) {
                        Image(systemName: "trophy.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 21, height: 21)
                        
                        Text("prêmios")
                    }
                
            })
            
            
        }
    }
}

#Preview {
    PlanoB()
}
