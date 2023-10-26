//
//  ContentView.swift
//  FaculdadeAPI
//
//  Created by Student07 on 25/10/23.
//

import SwiftUI

struct ContentView: View {
    var menus = ["Ver Faculdades","Editar Faculdades","Excluir Faculdades", "Adicionar Faculdades"]
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .zero, endPoint: .center)
                    .frame(width: .infinity, height: .infinity)
                VStack {
                    
                    NavigationLink(destination: FaculdadeView()){
                        Text(menus[0])
                            .font(.largeTitle)
                            .fontWeight(.black)
                    }.foregroundColor(.white)
                }
                .padding()
            }.ignoresSafeArea(.all)
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
