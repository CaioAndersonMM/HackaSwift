//
//  AssetsView.swift
//  CoinApp
//
//  Created by Student07 on 20/10/23.
//

import SwiftUI

struct AssetsView: View {
    @StateObject var vm = viewModel()
    var body: some View {
        VStack{
            ScrollView{
                ForEach(vm.coins){ coin in
                    NavigationLink(destination: DetailAssets(idCoin : coin.id!)){
                        HStack{
                            Text(coin.symbol!)
                            Spacer()
                            Text(coin.name!)
                        }.padding(30).background(.gray).foregroundColor(.white)
                    }
                }
            }
        }.background(.black).onAppear(){
            vm.fetch()
        }
    }
}

struct AssetsView_Previews: PreviewProvider {
    static var previews: some View {
        AssetsView()
    }
}
