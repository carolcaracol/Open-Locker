//
//  NavBar.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 20/06/24.
//

import SwiftUI

struct NavBar: View {
    var body: some View {
        HStack{
            
            Button(
                action: {
                    // Mudar para home
                
            }, label: {
                    
                ZStack {
                    Image(.fichaHome)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130, height: 55)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 1) {
                            Image(.homeIcon)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 20, height: 18)
                                
                                Text("home")
                            .foregroundColor(.white)
                            .bold()
                
                    }
                }
            })
            
            
            Button(
                action: {
                    // Mudar para galeria
                
            }, label: {
                
                ZStack {
                    Image(.fichaGaleria)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 140, height: 55)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 1) {
                            Image(.galeriaIcon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 18)
                            
                            Text("galeria")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
            })
            
            
            Button(
                action: {
                    // Mudar para premios
                
            }, label: {
               
                ZStack{
                    Image(.fichaPremios)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130, height: 55)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 2) {
                            Image(.trofeuIcon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 21, height: 21)
                            
                            Text("prêmios")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                
            })
            
            
        } .ignoresSafeArea()
    }
}

#Preview {
    NavBar()
}
