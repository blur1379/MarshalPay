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
                pages = .Walet
                showTabBar = true
            }) {
                
                VStack (alignment: .center, spacing: 4.0){
                    Image( pages == .Walet ? "kifpol_pink" : "kifpol")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32, alignment: .center)
                        .foregroundColor(Color("marshal_White"))
                    if pages == .Walet {
                        Text("کیف پول")
                            .foregroundColor(Color("marshal_red"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    }
                    
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
            }
            
            Button(action: {
                //write code 😎
                pages = .Invest
                showTabBar = true
            }) {
                
                VStack (alignment: .center, spacing: 4.0){
                    Image(pages == .Invest ? "sarmaye_pink" : "sarmaye")
                        .resizable()
                        .scaledToFit()
                        .frame( height: 32, alignment: .center)
                        .foregroundColor(Color("marshal_White"))
                    if pages == .Invest{
                        Text("سرمایه گذاری")
                            .foregroundColor(Color("marshal_red"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    }
                    
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
            }
            
            
            Button(action: {
                pages = .Exchange
                showTabBar = true
            }) {
                
                VStack (alignment: .center, spacing: 4.0){
                    Image( pages == .Exchange ? "dolar_pink" : "dolar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32, alignment: .center)
                        .foregroundColor(Color("marshal_White"))
                    
                    if pages == .Exchange {
                        
                        Text("صرافی")
                            .foregroundColor(Color("marshal_red"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                        
                        
                    }
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
            }
            
            Button(action: {
                //write code 😎
                pages = .History
                showTabBar = true
            }) {
                
                VStack (alignment: .center, spacing: 4.0){
                    Image(pages == .History ? "tarakonesh_pink" : "tarakonesh")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32, alignment: .center)
                        .foregroundColor(Color("marshal_White"))
                    if pages == .History {
                        Text("تاریخچه")
                            .foregroundColor(Color("marshal_red"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
            }
         
            Button(action: {
                  pages = .Profile
                showTabBar = true
                
            }) {
                
                VStack (alignment: .center, spacing: 4.0){
                    Image(pages == .Profile ? "p_pink" : "p")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32, alignment: .center)
                        .foregroundColor(Color("marshal_White"))
                    if pages == .Profile{
                        Text("کاربر")
                            .foregroundColor(Color("marshal_red"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
            }
            
            
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
