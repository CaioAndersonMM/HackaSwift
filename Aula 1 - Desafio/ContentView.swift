//
//  ContentView.swift
//  Aula 1 - Desafio
//
//  Created by Student07 on 17/10/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack{
            VStack {
                
                ZStack{
                          
                    LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .frame(width: .infinity, height: .infinity)
                    VStack{
                        
                        Image("captura").resizable()
                            .scaledToFill().frame(width: 150, height: 150)
                            .cornerRadius(10).padding(.top, 90.0)
                        
                        
                        
                        VStack{
                            HStack{
                                Text("HackaFM").foregroundColor(.white).padding(.trailing).padding(.top, 20.0).font(.title2).bold()
                                
                                Spacer()
                            }
                            
                            HStack{
                                Image("captura").resizable().frame(width: 30.0, height: 30.0).scaledToFill()
                                Text("Hacksong").foregroundColor(.white)
                                Spacer()
                            }
                            
                        }.padding()
                        
                        
                        VStack{
                            ScrollView{
                                ForEach(arraySongs) { item in
                                    HStack{
                                        
                                        NavigationLink(destination: SongDetail(x: item)){
                                            AsyncImage(url: URL(string: item.capa)){ phase in
                                                if let image = phase.image {
                                                    image
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 100, height: 100)
                                                        .cornerRadius(10)
                                                }
                                            }
                                        }
                                        
                                        VStack(alignment: .leading){
                                            Text(item.name).foregroundColor(.white)
                                            Text(item.artist).foregroundColor(.white)
                                        }
                                        .padding(.leading, 7.0)
                                        Spacer()
                                        Image(systemName: "ellipsis").padding(.trailing).foregroundColor(.white)
                                        
                                    }
                                    .padding(.leading, 10.0)
                                }
                                
                                Text("Sugeridos").foregroundColor(.white).font(.title)
                                
                                ScrollView(.horizontal){
                                    HStack{
                                        ForEach(arraySongs) { item in
                                            AsyncImage(url: URL(string: item.capa)){ phase in
                                                if let image = phase.image {
                                                    image
                                                        .resizable()
                                                        .scaledToFill()
                                                        .frame(width: 100, height: 100)
                                                        .cornerRadius(10)
                                                }
                                                
                                                
                                            }
                                        }
                                        
                                    }
                                }
                                
                                
                            }
                            
                            
                            
                        }
                        
                    }
                    
                }
                           
            }.edgesIgnoringSafeArea(.all)
        }.accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
