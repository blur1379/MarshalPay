//
//  MarshalTabBar.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/8/1400 AP.
//

import SwiftUI

struct MarshalTabBar: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
                    
                    //Spacer()
                    
                    Button(action: {
                        //write code 😎
                    }) {
                        
                        VStack (alignment: .center, spacing: 4.0){
                            Image("icon_account_24dp")
                                .resizable()
                                .frame(width: 32, height: 32, alignment: .center)
                                .foregroundColor(Color("marshal_White"))
                            Text("کاربر")
                                .foregroundColor(Color("marshal_White"))
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                            
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        
                    }
                    
                //Spacer()
                    
                    Button(action: {
                        //write code 😎
                    }) {
                        
                        VStack (alignment: .center, spacing: 4.0){
                            Image("icon_wallet_24dp")
                                .resizable()
                                .frame(width: 32, height: 32, alignment: .center)
                                .foregroundColor(Color("marshal_White"))
                            Text("کیف پول")
                                .foregroundColor(Color("marshal_White"))
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                            
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        
                    }
                    
                    //Spacer()
                    
                    Button(action: {
                        //write code 😎
                    }) {
                        
                        VStack (alignment: .center, spacing: 4.0){
                            Image("icon_trend_24dp")
                                .resizable()
                                .frame(width: 32, height: 32, alignment: .center)
                                .foregroundColor(Color("marshal_White"))
                            Text("بازار")
                                .foregroundColor(Color("marshal_White"))
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                            
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        
                    }
                    
                    //Spacer()
                    
                    Button(action: {
                        //write code 😎
                    }) {
                        
                        VStack (alignment: .center, spacing: 4.0){
                            Image("icon_marshal_24dp")
                                .resizable()
                                .frame(width: 32, height: 32, alignment: .center)
                                .foregroundColor(Color("marshal_White"))
                            Text("صرافی")
                                .foregroundColor(Color("marshal_White"))
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                            
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                        
                    }
                    
                    //Spacer()
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 80, alignment: .center)
                .background(Color("marshal_surfGrey"))
    }
}

struct MarshalTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MarshalTabBar()
            .previewLayout(.sizeThatFits)
    }
}
