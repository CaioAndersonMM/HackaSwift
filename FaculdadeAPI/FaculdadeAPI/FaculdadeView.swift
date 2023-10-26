//
//  FaculdadeView.swift
//  FaculdadeAPI
//
//  Created by Student07 on 25/10/23.
//

import SwiftUI

struct FaculdadeView: View {
    @StateObject var vm = viewModel()

    var body: some View {
        NavigationStack{
            VStack{
                AsyncImage(url: URL(string:"https://cdn-icons-png.flaticon.com/512/3663/3663869.png")){ phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 250, height: 250)
                          
                    }
                    
                }

                ScrollView{
                    ForEach(vm.faculdades, id: \.self){ facul in
                        
                        HStack{
                            
                            NavigationLink(destination: DetailFaculdade(faculdade: facul)){
                                AsyncImage(url: URL(string: "https://cdn-icons-png.flaticon.com/512/2133/2133147.png")){ phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .cornerRadius(10)
                                    }
                                }
                                
                                VStack(alignment: .leading){
                                    Text(facul.nomeFaculdade!).foregroundColor(.white)
                                    Text(facul.cidade!).foregroundColor(.white)
                                }
                                .padding(.leading, 7.0)
                                Spacer()
                                Image(systemName: "ellipsis").padding(.trailing).foregroundColor(.white)
                                
                            }
                            .padding(.leading, 10.0)
                        }

                    }
                }
            }.background(.black).onAppear(){
                vm.fetch()
            }
        }
        
    }
}

struct FaculdadeView_Previews: PreviewProvider {
    static var previews: some View {
        FaculdadeView()
    }
}
