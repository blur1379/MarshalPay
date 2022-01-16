//
//  MarshalWalletTabBar.swift
//  Marshal
//
//  Created by Moeen Kashisaz on 1/16/22.
//

import SwiftUI

struct MarshalWalletTabBar: View {
    //MARK: -PROPERTIES
    @Binding var page : WalletPages
    let onBack : () -> Void
    //MARK: -BODY
    var body: some View {
        HStack(alignment: .center) {
            Button {
                onBack()
            } label: {
                Image (systemName: "arrow.backward")
                    .frame(width: 40, height: 40, alignment: .leading)
                    .foregroundColor(Color("marshal_red"))
                    .imageScale(.large)
            }

           

            Text(ConstantData().walletPageTitle(page: page))
                
                .foregroundColor(Color("marshal_White"))
                .font(Font.custom("IRANSansMobileFaNum Bold", size: 18))
            
            
            Spacer()
            
            Image ("marshal_logo-wings")
                .resizable()
                .frame(width: 96, height: 22, alignment: .center)
                .scaledToFit()
            
  
        }
        .padding(.horizontal, 16.0)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 56)
    }
}
//MARK: -PREVIEW
struct MarshalWalletTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MarshalWalletTabBar(page: .constant(.wallet), onBack: {})
    }
}
