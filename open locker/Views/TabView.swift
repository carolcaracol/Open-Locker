//
//  TabView.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 27/06/24.
//

import SwiftUI

struct TabView: View {
    var body: some View {
        HStack{
            // Botao Tecnicas
            NavigationLink(destination: HomePrincipal().navigationBarBackButtonHidden()){
                TabTecnicas()
            }
            .padding(.trailing, -25)
            
            // Botao Galeria
            NavigationLink(destination: GalleryView()) {
                TabGaleria()
            }
            .padding(.trailing, -25)
            // Botao Premios
            NavigationLink(destination: NotebookView()){
                TabPremios()
            }
        }
    }
}

#Preview {
    TabView()
}
