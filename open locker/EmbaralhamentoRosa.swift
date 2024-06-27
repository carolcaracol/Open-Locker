//
//  Embaralhamento.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 25/06/24.
//

import SwiftUI

struct EmbaralhamentoRosa: View {
    
    
    @State private var currentFrame = 0
        private let frames = ["default", "variante1", "variante2", "variante3", "variante4", "variante5", "variante6", "variante7", "variante8", "variante9", "variante10", "variante11", "variante12", "variante13", "variante14", "variante10", "variante11", "variante12", "variante13", "variante14", "variante10", "variante11", "variante12", "variante13", "variante14" ]
    
        private let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect() // Define o intervalo de tempo para cada frame

    
    var body: some View {
                
        Image(frames[currentFrame])
                    .resizable()
                    .scaledToFit()
                    .onReceive(timer) { _ in
                        currentFrame = (currentFrame + 1) % frames.count // Atualiza o frame atual
                    }
        

    }
}

#Preview {
    EmbaralhamentoRosa()
}
