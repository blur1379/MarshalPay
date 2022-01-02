//
//  Home.swift
//  Marshal
//
//  Created by Blur on 10/7/1400 AP.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0.0) {
            
            MarshalTopBarType01()
            
            Divider()
                .frame(height: 1.0).background(Color("marshal_red"))
            
            //Spacer()
            MarshalWalletTabPageModule()
                .padding(.horizontal, 16.0)
                .padding(.top, 16.0)
            
            Divider()
                .frame(height: 1.0).background(Color("marshal_red"))
            
            MarshalTabBar()

        }// VSTACK
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("marshal_darkGrey"))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
