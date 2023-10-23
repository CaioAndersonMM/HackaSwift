//
//  DetailAssets.swift
//  CoinApp
//
//  Created by Student07 on 20/10/23.
//

import SwiftUI

struct DetailAssets: View {
    var idCoin : String
    
    
    @StateObject var vm = viewModel()
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            VStack{
                
                Text("Detalhes de \(idCoin)")
                    .font(.title)
                    .fontWeight(.black).foregroundColor(.white)
                ForEach(vm.coin){ coin in
                    VStack(alignment: .leading){
                        Text("Símbolo: \(coin.symbol!)")
                        Text("Nome: \(coin.name!)")
                        if (coin.changePercent24Hr != nil){
                            Text("Porcentagem de Mudança nas 24H: \(coin.changePercent24Hr!)")
                        }
                            Text("Limite de Preço de Mercado: \(coin.marketCapUsd!)")
                            Text("Máxima Oferta: \(coin.maxSupply!)")
                            Text("Preço em Dólar: \(coin.priceUsd!)")
                            Text("Ranked: \(coin.rank!)")
                            Text("Circulaçao: \(coin.supply!)")
                            Text("Montante Financeiro em Dólar\(coin.volumeUsd24Hr!)")
                            Text("Preço Médio nas 24h: \(coin.vwap24Hr!)")
                            
                    }.padding(30).background(.gray).foregroundColor(.white)
                }
            }.padding(30).background(.black).edgesIgnoringSafeArea(.all) .onAppear(){
                vm.fetch(coinId: idCoin)
            }
            Spacer()

        }
    }
}

struct DetailAssets_Previews: PreviewProvider {
    static var previews: some View {
        DetailAssets(idCoin: "Teste")
    }
}
