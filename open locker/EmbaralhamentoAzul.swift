//
//  EmbaralhamentoAzul.swift
//  open locker
//
//  Created by Maria Julia Souza Balbino on 26/06/24.
//

import SwiftUI

struct EmbaralhamentoAzul: View {
    
    @State private var currentFrame = 0
    private let frames = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    private let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect() // Define o intervalo de tempo para cada frame
    
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
    EmbaralhamentoAzul()
}
