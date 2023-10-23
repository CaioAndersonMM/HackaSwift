//
//  APIViewModel.swift
//  CoinApp
//
//  Created by Student07 on 20/10/23.
//

import Foundation

struct API: Decodable{
    var data : [CoinMenu]
}

struct API2: Decodable{
    var data : Coin
}


struct CoinMenu : Decodable, Identifiable{
    var id: String?
    var rank: String?
    var symbol: String?
    var name: String?
}

struct Coin : Decodable, Identifiable{
    var id: String?
    var rank: String?
    var symbol: String?
    var name: String?
    var supply: String?
    var maxSupply: String?
    var marketCapUsd: String?
    var volumeUsd24Hr: String?
    var priceUsd: String?
    var changePercent24Hr: String?
    var vwap24Hr: String?
}


class viewModel : ObservableObject{
    
    @Published var coins : [CoinMenu] = []
    @Published var coin : [Coin] = []
    
    func fetch(){
        guard let url = URL(string: "https://api.coincap.io/v2/assets") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            
            guard let data = data, error == nil else { return } // se houver error
            
            do{
                let decodificado = try JSONDecoder().decode(API.self, from: data)
                DispatchQueue.main.sync {
                    self?.coins = decodificado.data
                }
            } catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
    func fetch(coinId: String){
        guard let url = URL(string: "https://api.coincap.io/v2/assets/\(coinId)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            
            guard let data = data, error == nil else { return } // se houver error
            
            do{
                let decodificado = try JSONDecoder().decode(API2.self, from: data)
                DispatchQueue.main.sync {
                    
                    self?.coin.append(decodificado.data)
                }
            } catch{
                print(error)
            }
        }
        
        task.resume()
        
        
    }
    
}
