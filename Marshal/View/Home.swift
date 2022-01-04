//
//  Home.swift
//  Marshal
//
//  Created by Blur on 10/7/1400 AP.
//

import SwiftUI

struct Home: View {
    //MARK: - PROPERTIS
    enum homePages{
        case Exchange
        case History
        case Walet
        case Profile
    }
    @State var Page : homePages = .Walet
    //MARK: -BODY
    var body: some View {
        VStack{
            // tap view
            
            // body
            switch Page {
            case .Exchange:
                Text("exchenge")
            case .History:
                Text("history")
            case .Walet:
                VStack(alignment: .center, spacing: 0.0) {
                    
                    MarshalTopBarType01()
                    
                    Divider()
                        .frame(height: 1.0).background(Color("marshal_red"))
                    
                    //Spacer()
                    
                    CompleteProfileAllStepModule()
                        //.padding(.horizontal, 16.0)
                        .padding(.top, 16.0)
                    
                    
                    
//                    MarshalWalletTabPageModule()
//                        .padding(.horizontal, 16.0)
//                        .padding(.top, 16.0)
                    
                    Divider()
                        .frame(height: 1.0).background(Color("marshal_red"))
                    
                    MarshalTabBar()

                }// VSTACK
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color("marshal_darkGrey"))
                .edgesIgnoringSafeArea(.bottom)

            case .Profile:
                Text("profile")
            }
            //tab bar
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
