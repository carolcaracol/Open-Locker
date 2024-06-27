//
//  test.swift
//  open locker
//
//  Created by João Mateus Gonçalves da Silva on 20/06/24.
//
//
//import SwiftUI
//
//// Modificador customizado para definir a cor de fundo da barra de navegação
////extension View {
////    func navigationBarColor(_ backgroundColor: Color) -> some View {
////        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
////    }
////}
////
////struct NavigationBarModifier: ViewModifier {
////    var backgroundColor: Color
////
////    init(backgroundColor: Color) {
////        self.backgroundColor = backgroundColor
////
////        // Configura a aparência da barra de navegação
////        let appearance = UINavigationBarAppearance()
////        appearance.configureWithOpaqueBackground()
////        appearance.backgroundColor = UIColor(backgroundColor)
////
////        // Aplica a aparência à barra de navegação globalmente
////        UINavigationBar.appearance().standardAppearance = appearance
////    }
////
////    func body(content: Content) -> some View {
////        content
////            .onAppear {
////                // Configura a barra de navegação localmente quando a view aparece
////                let appearance = UINavigationBarAppearance()
////                appearance.configureWithOpaqueBackground()
////                appearance.backgroundColor = UIColor(self.backgroundColor)
////
////                UINavigationBar.appearance().standardAppearance = appearance
////            }
////    }
////}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
