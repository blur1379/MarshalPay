//
//  MarshalTabBar.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/8/1400 AP.
//

import SwiftUI

struct MarshalTabBar: View {
    @Binding var pages : HomePages
    @AppStorage("showTabBar") var showTabBar = true
    var body: some View {
        
        HStack(alignment: .center, spacing: 0) {
            
            
            Button(action: {
                //write code 😎
                pages = .Invest
                showTabBar = true
            }) {
                
                VStack (alignment: .center, spacing: 4.0){
                    Image("sarmaye")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32, alignment: .center)
                        .foregroundColor(Color("marshal_White"))
                    if pages == .Invest{
                        Text("سرمایه گذاری")
                            .foregroundColor(Color("marshal_White"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    }
                    
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
            }
            
            
            
            
            //Spacer()
            
            
            
            Button(action: {
                //write code 😎
                pages = .Profile
                showTabBar = true
            }) {
                
                VStack (alignment: .center, spacing: 4.0){
                    Image("icon_account_24dp")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32, alignment: .center)
                        .foregroundColor(Color("marshal_White"))
                    if pages == .Profile{
                        Text("کاربر")
                            .foregroundColor(Color("marshal_White"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
            }
            
            //Spacer()
            
            Button(action: {
                //write code 😎
                pages = .Walet
                showTabBar = true
            }) {
                
                VStack (alignment: .center, spacing: 4.0){
                    Image("kifpol")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32, alignment: .center)
                        .foregroundColor(Color("marshal_White"))
                    if pages == .Walet {
                        Text("کیف پول")
                            .foregroundColor(Color("marshal_White"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    }
                    
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
            }
            
            //Spacer()
            
            Button(action: {
                //write code 😎
                pages = .History
                showTabBar = true
            }) {
                
                VStack (alignment: .center, spacing: 4.0){
                    Image("tarakonesh")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32, alignment: .center)
                        .foregroundColor(Color("marshal_White"))
                    if pages == .History {
                        Text("بازار")
                            .foregroundColor(Color("marshal_White"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
            }
            
            //Spacer()
            
            Button(action: {
                //write code 😎
                pages = .Exchange
                showTabBar = true
            }) {
                
                VStack (alignment: .center, spacing: 4.0){
                    Image("dolar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32, alignment: .center)
                        .foregroundColor(Color("marshal_White"))
                    
                    if pages == .Exchange {
                        
                        Text("صرافی")
                            .foregroundColor(Color("marshal_White"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                        
                        
                    }
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
            }
            
            //Spacer()
            
            
        }
        .animation(.easeIn, value: pages)
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 80, alignment: .center)
        .background(Color("marshal_surfGrey"))
        //.background(.clear)
        
    }
}

struct MarshalTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MarshalTabBar(pages: .constant(.Exchange))
            .previewLayout(.sizeThatFits)
    }
}
