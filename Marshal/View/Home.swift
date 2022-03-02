//
//  Home.swift
//  Marshal
//
//  Created by Blur on 10/7/1400 AP.
//

import SwiftUI

struct Home: View {
    //MARK: - PROPERTIS
    @AppStorage("showLogin") var showLogin = false
    @AppStorage("acc") var acceceToken = ""
    @AppStorage("showTabBar") var showTabBar : Bool = true
    @State var page : HomePages = .Exchange
    //MARK: -BODY
    var body: some View {
        ZStack{
            // tap view
            VStack(alignment: .center, spacing: 0.0) {
                if showTabBar {
                    MarshalTopBarType01(page: $page)
                    Divider()
                        .frame(height: 1.0).background(Color("marshal_red"))
                }
                // body
                
                Group{
                    switch page {
                    case .Exchange:
                        MarshalTrendTabPageModule()
                    case .History:
                        UserLevelModule()
                            .onAppear {
                                if acceceToken == "" {
                                    showLogin = true
                                }
                            }
                    case .Walet:
                        MarshalWalletTabPageModule()
                            .onAppear {
                                if acceceToken == "" {
                                    showLogin = true
                                }
                            }
                    case .Profile:
                        //UserLevelModule()
                        ProfileModule()
                            .onAppear {
                                if acceceToken == "" {
                                    showLogin = true
                                }
                            }
                        //.padding(.horizontal, 16.0)
                    case .Invest:
                        InvestmentModule()
                            .onAppear {
                                if acceceToken == "" {
                                    showLogin = true
                                }
                            }
                    }
                }
                
                Divider()
                    .frame(height: 1.0).background(Color("marshal_red"))
                
                MarshalTabBar(pages: $page)
                    .padding(.bottom , 8)
                
            }// VSTACK
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color("marshal_darkGrey"))
            .edgesIgnoringSafeArea(.bottom)
            //tab bar
        }
        .onAppear{
            showTabBar = true
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
        //.background(Color("marshal_darkGrey"))
    }
}
