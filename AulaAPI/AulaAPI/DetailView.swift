//
//  DetailView.swift
//  AulaAPI
//
//  Created by Student07 on 19/10/23.
//

import SwiftUI

struct DetailView: View {
    @State var v : Personagem
    var body: some View {
        VStack(alignment: .center){
            Spacer()
            AsyncImage(url: URL(string: "\(v.imageUrl!)")){ image in
                image.resizable().scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200.0, height: 200.0)
            
            VStack(alignment: .center){
                HStack{
                    Text("Nome: ")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color(.gray))
                    Text(v.fullName!)                      .font(.largeTitle)
                        .fontWeight(.heavy)

                }
                HStack{
                    Text("Primeiro Nome: ") .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color(.gray))
                    Text(v.firstName!)                     .font(.largeTitle)
                        .fontWeight(.heavy)

                }
                
                HStack{
                    Text("Último Nome: ") .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color(.gray))
                    Text(v.lastName!)
                        .font(.largeTitle)
                            .fontWeight(.heavy)
                }
                
                HStack{
                    Text("Título: ") .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color(.gray))
                    Text(v.title!)                        .font(.largeTitle)
                        .fontWeight(.heavy)

                }
                
                HStack{
                    Text("Família: ") .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color(.gray))
                    Text(v.family!)                        .font(.largeTitle)
                        .fontWeight(.heavy)

                }
            }
            
            
            Spacer()
        }
        .frame(width:400).background(Color(.black)).foregroundColor(.white).edgesIgnoringSafeArea(.all)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(v: Personagem(id: 1, firstName: "caio", lastName: "caio", fullName: "caio", title: "caio", family: "caio", image: "caio", imageUrl: "https://thronesapi.com/assets/images/daenerys.jpg"))
    }
}
