//
//  Home.swift
//  Marshal
//
//  Created by Blur on 10/7/1400 AP.
//

import SwiftUI

struct Home: View {
    //MARK: - PROPERTIS

    @State var page : homePages = .Exchange
    //MARK: -BODY
    var body: some View {
        
        ZStack{
            // tap view
            VStack(alignment: .center, spacing: 0.0) {
                
                MarshalTopBarType01(page: $page)
                    
                
                Divider()
                    .frame(height: 1.0).background(Color("marshal_red"))
                
            // body
            switch page {
            case .Exchange:
                MarshalExchangeTabPageModule()
            case .History:
                Text("history")
            case .Walet:
            


                    MarshalTrendTabPageModule()

//                    MarshalWalletTabPageModule()

                    
                    Divider()
                        .frame(height: 1.0).background(Color("marshal_red"))
                    
            case .Profile:
                CompleteProfileAllStepModule()
                //.padding(.horizontal, 16.0)
                    .padding(.top, 16.0)
                                 
            }
                Divider()
                    .frame(height: 1.0).background(Color("marshal_red"))
                
                MarshalTabBar(pages: $page)

            }// VSTACK
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color("marshal_darkGrey"))
            .edgesIgnoringSafeArea(.bottom)
            //tab bar
            
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            //.background(Color("marshal_darkGrey"))
    }
}
