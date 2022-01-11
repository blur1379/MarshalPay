//
//  MarshalExchangeTabPageModule.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/14/1400 AP.
//

import SwiftUI

struct MarshalExchangeTabPageModule: View {
    var body: some View {
        VStack(spacing: 0){
            ExchangeTopBar()
            ExchangeList()
            Spacer()
        }//:Vstack
    }
}

struct MarshalExchangeTabPageModule_Previews: PreviewProvider {
    static var previews: some View {
        MarshalExchangeTabPageModule()
    }
}
