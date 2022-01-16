//
//  WalletPriceList.swift
//  Marshal
//
//  Created by Moeen Kashisaz on 1/15/22.
//

import SwiftUI

struct WalletPriceList: View {
    //MARK: -PROPERTIES
    
    @State var waletCorencies = [WalletCurrency]()
    //MARK: -BODY
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(waletCorencies){walletCurrency in
                    WalletRowModule(walletCurrency: walletCurrency)
                        .padding([.trailing,.leading] , 8)
                }//: ENDLOOP
            }//:LAZYVSTACK
            .padding(.top , 16)
        }//:SCROLLVIEW
    }
}
//MARK: -PREVIEW
struct WalletPriceList_Previews: PreviewProvider {
    static var previews: some View {
        WalletPriceList()
    }
}
