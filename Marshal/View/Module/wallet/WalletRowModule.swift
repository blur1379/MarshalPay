//
//  WalletModule.swift
//  Marshal
//
//  Created by Moeen Kashisaz on 1/13/22.
//

import SwiftUI

struct WalletRowModule: View {
    //MARK: -PROPERTIES
    
    let walletCurrency : WalletCurrency
    //MARK: -BODY
    var body: some View {
        HStack (spacing: 8){
            
            Text("مارشال")
                .foregroundColor(Color("marshal_red"))
                .font(Font.custom("IRANSansMobileFaNum Bold", size: 16))
                .padding(.horizontal, 16.0)
                .cornerRadius(12.0)
                .frame(height: 32.0)
                .padding(.vertical ,16)

            Text(walletCurrency.getAmount())
                .foregroundColor(Color("marshal_White"))
                .font(Font.custom("IRANSansMobileFaNum Bold", size: 18))
                .padding(8.0)

            Spacer()
            
            HStack (spacing: 4){
                Text("مارشال")
                    .foregroundColor(Color("marshal_White"))
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 16))
                
                Text("/")
                    .foregroundColor(Color("marshal_White"))
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 16))
                
                Text(walletCurrency.currency.name)
                    .foregroundColor(Color("marshal_White"))
                    .font(Font.custom("IRANSansMobileFaNum Bold", size: 16))
            }
  
        }
        .padding(.horizontal, 12.0)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 56)
        .background(Color("marshal_surfGrey"))
        .cornerRadius(12)
        .overlay(
        RoundedRectangle(cornerRadius: 12)
            .stroke(Color("marshal_red"), lineWidth: 0.5)
        )
    }
}

struct WalletRowModule_Previews: PreviewProvider {
    static var previews: some View {
        WalletRowModule(walletCurrency: WalletCurrency())
    }
}
