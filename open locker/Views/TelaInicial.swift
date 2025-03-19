//
//  TelaInicial.swift
//  open locker
//
//  Created by João Mateus Gonçalves da Silva on 19/06/24.
//
import SwiftUI

struct TelaInicial: View {
    
    @State var isPresented: Bool  = false
    
    var body: some View {
        ZStack {
//            Image(.fundorecorte)
//            
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(Color.roxoescuro, lineWidth: 3).frame(width: 360.0, height: 725.0)
                
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
                        NavigationLink(destination: HomePrincipal()) {
                            Image(.inicio)
                        }
                        Spacer()
                        Image(.lock)
                    }
                    
                    Button (action: {isPresented = true
                    print("cliquei")}){
                        Image(.sobre)
                        .frame(height: 55)
                    }.padding(.top, -30)
//                    {
//                        isPresented = true
//                    } label: {
//                        Image(.sobre)
//                            .padding(.top, -30)
//                    }
                   
                }
                .padding(.leading, 40)
                .padding(.bottom, 40)
                .padding(.trailing, 40)
                //                    .padding([.bottom, .trailing], 120.0)
                
                Spacer()
            }
            
            
           
        if isPresented{
                PopupSobre(isPresented: $isPresented)
            }
        } .background(Color.roxoclaro)
            .edgesIgnoringSafeArea(.all)
        
        }
    }

#Preview {
    TelaInicial()
}

