//
//  ViewModel.swift
//  AulaAPI
//
//  Created by Student07 on 19/10/23.
//

import Foundation

struct Personagem: Codable, Identifiable {
        var id : Int
        let firstName : String?
        let lastName : String?
        let fullName : String?
        let title : String?
        let family : String?
        let image : String?
        let imageUrl : String?
}


class ViewModel : ObservableObject{
    @Published var personagens : [Personagem] = []
    
    func fetch() {
        guard let url = URL(string: "https://thronesapi.com/api/v2/Characters") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do {
                let parsed = try JSONDecoder().decode([Personagem].self, from: data)
                
                DispatchQueue.main.async {
                    self?.personagens = parsed
                }
                
                
            } catch{
                print(error)
            }
                        
        }
        
        task.resume()

    }
    
    
}
