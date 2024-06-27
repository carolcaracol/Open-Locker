//
//  OutraView.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 27/06/24.
//

import SwiftUI

struct OutraView: View {
    var body: some View {
        
        TabView{
            CartaDeBaralhoView()
                .tabItem {
                    Image(systemName: "house")
                }
            
           
                    
            
        }
    }
}

#Preview {
    OutraView()
}
