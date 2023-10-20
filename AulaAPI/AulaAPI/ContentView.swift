//
//  ContentView.swift
//  AulaAPI
//
//  Created by Student07 on 19/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var personagem = ViewModel()
    var body: some View {
        NavigationStack{
            ZStack {
                VStack(alignment: .center){
                    AsyncImage(url: URL(string: "https://documentdesignfall17.files.wordpress.com/2017/08/game-of-thrones-logo.jpg")){ image in
                        image.resizable().scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                    
                    
                    ScrollView{
                        ForEach(personagem.personagens){ person in
                            NavigationLink(destination: DetailView(v: person)){
                                
                                
                                VStack(alignment: .center, spacing: 3.0){
                                    AsyncImage(url: URL(string: "\(person.imageUrl!)")){ image in
                                        image.resizable().scaledToFit()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .padding(.bottom)
                                    .frame(width: 250, height: 200)
                                    Text(" \(person.fullName!)").font(.title2).fontWeight(.black).foregroundColor(.white)
                                    Text("\(person.family!)").fontWeight(.bold).foregroundColor(.white)
                                    Text(" \(person.title!)").font(.subheadline).fontWeight(.semibold).foregroundColor(.white)
                                }.padding(.top, 50.0).background(Color(.black))
                            }
                        }
                        
                    }.background(Color(.black))
                    
                    
                }.onAppear(){
                    personagem.fetch()
                    
                }
            }.edgesIgnoringSafeArea(.all).background(Color(.black))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
