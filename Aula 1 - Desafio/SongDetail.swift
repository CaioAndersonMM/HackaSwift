//
//  SongDetail.swift
//  Aula 1 - Desafio
//
//  Created by Student07 on 17/10/23.
//

import SwiftUI

struct SongDetail: View {
    var x : Song
    @State private var vinylRotation: Double = 20
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: .infinity, height: .infinity)
            
            VStack{
                Spacer()
                
                AsyncImage(url: URL(string: x.capa)){ phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .cornerRadius(10)
                    }
                }
                
                
                Text("\(x.name)").foregroundColor(.white).font(.title)
                Text("\(x.artist)").foregroundColor(.white).font(.subheadline)
                
                Spacer()
                
                HStack(alignment: .center, spacing: 29.0){
                    Image(systemName: "shuffle").foregroundColor(.white).font(.system(size: 30))
                    Image(systemName: "backward.end.fill").foregroundColor(.white).font(.system(size: 40))
                    Image(systemName: "play.fill").foregroundColor(.white).font(.system(size: 60))
                    Image(systemName: "forward.end.fill").foregroundColor(.white).font(.system(size: 40))
                    Image(systemName: "repeat").foregroundColor(.white).font(.system(size: 30))
                }
                
                Spacer()
            }
       
            
        }.edgesIgnoringSafeArea(.all)
    }
}

struct SongDetail_Previews: PreviewProvider {
    static var previews: some View {
        SongDetail(x: Song(id: 1, name: "Young And Beautiful", artist: "Lana del Rey", capa: "https://media.gazetadopovo.com.br/vozes/2013/04/lana_del_rey_young_beautiful-5ecb95dc.jpg"))
    }
}
