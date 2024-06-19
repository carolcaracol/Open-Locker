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
                ZStack {                   Image(.logoInicial)
                    Spacer()
                }
                .padding(.bottom, 36.0)
                Image(.fendas)
                Spacer()
                HStack {
                    Spacer()
                    Image(.inicio)
                    Spacer()
                    Image(.lock)
                        .padding()
                }
                Image(.sobre)
                    .padding()
                Spacer()
            }
            .padding()
            .background(Color.roxoclaro)
            .edgesIgnoringSafeArea(.all)
            Image(.fundorecorte)
        }
    }
}
#Preview {
    TelaInicial()
}

