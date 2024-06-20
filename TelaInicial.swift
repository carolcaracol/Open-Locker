//
//  TelaInicial.swift
//  open locker
//
//  Created by João Mateus Gonçalves da Silva on 19/06/24.
//
import SwiftUI

struct TelaInicial: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                ZStack {
                    Image(.logoInicial)
                        .padding(.bottom, 40)
                }
                Image(.fendas)
                    .padding(.bottom, 80)
                VStack(alignment: .leading) {
                    HStack {
                        Image(.inicio)
                        Spacer()
                        Image(.lock)
                    }
                    Image(.sobre)
                        .padding(.top, -30)
                }
                .padding(.leading, 40)
                .padding(.bottom, 40)
                .padding(.trailing, 40)
//                    .padding([.bottom, .trailing], 120.0)
                    
                Spacer()
            }
            .padding()
            .background(Color.roxoclaro)
            .edgesIgnoringSafeArea(.all)
            Image(.fundorecorte)
                .resizable()
                .scaledToFit()
            
        }
    }
}
#Preview {
    TelaInicial()
}

