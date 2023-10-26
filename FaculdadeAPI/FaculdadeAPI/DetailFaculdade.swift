//
//  DetailFaculdade.swift
//  FaculdadeAPI
//
//  Created by Student07 on 25/10/23.
//

import SwiftUI

struct DetailFaculdade: View {
    var faculdade : Faculdades
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.black, .white]), startPoint: .center, endPoint: .bottomLeading)
                .frame(width: .infinity, height: .infinity).ignoresSafeArea()
            
            VStack{
                
                Text("Detalhes de \(faculdade.nomeFaculdade!)")
                    .font(.title)
                    .fontWeight(.black).foregroundColor(.white)
                
                
                Rectangle()
                    .frame(width: 390, height: 4).foregroundColor(.white)
                
                VStack(alignment: .leading){
                    
                    HStack{
                        AsyncImage(url: URL(string: "https://freepngimg.com/save/36494-city-transparent/900x505")){ phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 105)
                            }
                        }
                        .padding(.horizontal, 90)
                        Spacer()
                        VStack{
                            Text("Cidade").fontWeight(.bold).foregroundColor(.white).padding([.top, .trailing], 30.0).font(.title)
                            Text(faculdade.cidade!).fontWeight(.semibold).foregroundColor(.white).font(.title3).padding(.trailing,34.0)
                             
                        }
                        
                        
                    }
                    
                 
                }
                
                    
                    Rectangle()
                    .frame(width: 390, height: 4).foregroundColor(.white).padding(.top, 10.0)

                AsyncImage(url: URL(string: "https://stfilm.com.br/wp-content/uploads/2019/07/img-predios.png")){ phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 150)
                    }
                }
                
                Text("Prédios da Faculdade")
                    .font(.title)
                    .fontWeight(.black).foregroundColor(.white)
                    .padding(.top, 10.0)
                

                ForEach(faculdade.predio, id: \.self) { predio in
                    HStack{
                        Text(predio.nome!).fontWeight(.bold).foregroundColor(.white).font(.title).padding([.top, .leading, .trailing], 40.0)
                        
                        ForEach(predio.curso, id: \.self) { curso in
                            Text(curso.nome!).fontWeight(.bold).foregroundColor(.white).font(.title3).padding([.top, .leading, .trailing], 40.0)
                        }
                    }
                }
                
            }
        }
        
        
    }
}

struct DetailFaculdade_Previews: PreviewProvider {
    static var previews: some View {
        DetailFaculdade(faculdade: Faculdades(nomeFaculdade: "Caio", cidade: "caio", predio: [Predios(nome: "LCC", curso: [Cursos(nome: "COMPUTACAO", area: "10")])]))
    }
}
