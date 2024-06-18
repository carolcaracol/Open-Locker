//
//  Sobre.swift
//  open locker
//
//  Created by João Mateus Gonçalves da Silva on 18/06/24.
//

import SwiftUI

struct CustomDialog: View {
    @Binding var isActiveSobre: Bool
   let titleSobre: String
   let messageSobre: String

    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.2)
                .onTapGesture {
                    close()
                }

            VStack {
                Text(titleSobre)
                    .font(.title2)
                    .bold()
                    .padding()

                Text(messageSobre)
                    .font(.body)
                
                    .padding()
            }
                
            .fixedSize(horizontal: false, vertical: true)
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay(alignment: .topTrailing) {
                Button {
                    close()
                } label: {
                    Image(systemName: "xmark")
                        .font(.title3)
                        .fontWeight(.medium)
                }
                .tint(.black)
                .padding()
            }
            .shadow(radius: 10)
            .padding(20)
//            .offset(x: 0, y: getOffset())
        }
        .ignoresSafeArea()
        .opacity(getOpacity())
        .animation(.easeInOut(duration: 0.5), value: isActiveSobre)
    }

    func close() {
        isActiveSobre = false
    }
    private func getOffset() -> CGFloat {
        if isActiveSobre {
            0
        } else {
            1000
        }
    }
    
    private func getOpacity() -> CGFloat {
        if isActiveSobre {
            1
        } else {
            0
        }
    }
}

struct CustomDialog_Previews: PreviewProvider {
    
    @State var test = [0,0,0]
    
    static var previews: some View {
        CustomDialog(isActiveSobre: .constant(true), titleSobre: "Sobre", messageSobre: "____________________")
    }
}
