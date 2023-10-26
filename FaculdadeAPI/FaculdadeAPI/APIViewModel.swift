//
//  APIViewModel.swift
//  FaculdadeAPI
//
//  Created by Student07 on 25/10/23.
//

import Foundation

struct API: Decodable{
    var data : [Faculdades]
}

struct Faculdades : Decodable, Hashable{
    //var id: String?
    var nomeFaculdade: String?
    var cidade: String?
    var predio: [Predios]
}

struct Predios : Decodable, Hashable{
    //var id: String?
    var nome: String?
    var curso: [Cursos]
}

struct Cursos : Decodable, Hashable{
    //var id: String?
    var nome: String?
    var area: String?
}


class viewModel : ObservableObject{
    
    @Published var faculdades : [Faculdades] = []
    
    func fetch(){
        guard let url = URL(string: "http://127.0.0.1:1880/lerFaculdade") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            
            guard let data = data, error == nil else { return } // se houver error
            
            do{
                let decodificado = try JSONDecoder().decode([Faculdades].self, from: data)
                DispatchQueue.main.sync {
                    self?.faculdades.append(contentsOf: decodificado)
                }
            } catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
    
    
    
    
}
