//
//  SongModels.swift
//  Aula 1 - Desafio
//
//  Created by Student07 on 17/10/23.
//

import Foundation

struct Song: Identifiable{
    var id: Int
    var name: String
    var artist: String
    var capa: String
}

var arraySongs = [
    Song(id: 1, name: "Young And Beautiful", artist: "Lana del Rey", capa: "https://media.gazetadopovo.com.br/vozes/2013/04/lana_del_rey_young_beautiful-5ecb95dc.jpg"),
    Song(id: 2, name: "West Coast", artist: "Lana del Rey", capa: "https://upload.wikimedia.org/wikipedia/pt/2/2b/Capa_de_West_Coast.png"),
    Song(id: 3, name: "Ultraviolence", artist: "Lana del Rey", capa: "https://upload.wikimedia.org/wikipedia/pt/7/74/Ultraviolence.png"),
    Song(id: 4, name: "HoneyMoon", artist: "Lana del Rey", capa: "https://m.media-amazon.com/images/I/71ZvezJ2OoL._UF1000,1000_QL80_.jpg"),
    Song(id: 5, name: "Lust for Life", artist: "Lana del Rey", capa: "https://upload.wikimedia.org/wikipedia/pt/c/cd/Lust_for_Life_-_Lana_Del_Rey.png"),
    Song(id: 6, name: "Art Deco", artist: "Lana del Rey", capa: "https://m.media-amazon.com/images/I/71ZvezJ2OoL._UF1000,1000_QL80_.jpg"),
    Song(id: 7, name: "Brooklyn Baby", artist: "Lana del Rey", capa: "https://upload.wikimedia.org/wikipedia/pt/7/74/Ultraviolence.png")

]

