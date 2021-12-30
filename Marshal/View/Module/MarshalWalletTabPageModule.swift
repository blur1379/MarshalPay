//
//  MarshalWalletTabPage.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/8/1400 AP.
//

import SwiftUI

struct MarshalWalletTabPageModule: View {
    var body: some View {
        VStack (alignment: .center, spacing: 16.0){
            
            HStack(alignment: .center, spacing: 8.0) {
                
                Button(action: {
                    //write code 😎
                }) {
                        Text("انتقال")
                            .foregroundColor(Color("marshal_White"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 18))
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 48)
                            .background(Color("marshal_darkGrey"))
                            .cornerRadius(12.0)
                            .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color("marshal_White"), lineWidth:0.5)
                            )
                }
                
                Button(action: {
                    //write code 😎
                }) {
                        Text("واریز")
                            .foregroundColor(Color("marshal_White"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 18))
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 48)
                            .background(Color("marshal_darkGrey"))
                            .cornerRadius(12.0)
                            .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color("marshal_White"), lineWidth:0.5)
                            )
                }
                
                Button(action: {
                    //write code 😎
                }) {
                        Text("برداشت")
                            .foregroundColor(Color("marshal_White"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 18))
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 48)
                            .background(Color("marshal_darkGrey"))
                            .cornerRadius(12.0)
                            .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color("marshal_White"), lineWidth:0.5)
                            )
                }
                
                
            }
            //.padding(.horizontal, 16.0)
            
            HStack (alignment: .center, spacing: 0.0){
                
                HStack (spacing: 8){
                    Text("مارشال")
                        .foregroundColor(Color("marshal_darkGrey"))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 18))
                        .padding(.leading, 16.0)
                        .frame(height: 56)
                        
                    Image("marshal_M")
                        .resizable()
                        .frame(width: 24, height: 24, alignment: .center)
                        .foregroundColor(Color("marshal_darkGrey"))
                        .padding(.trailing, 14.0)
                }
                .frame(width: 120)
                .background(RoundedCorners(color: Color("marshal_White"), tl: 12, tr: 0, bl: 12, br: 0))
  
                Text("۰۰۰,۰۰۰,۰۰۰")
                    .foregroundColor(Color("marshal_White"))
                    .font(Font.custom("IRANSansMobileFaNum Bold", size: 24))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    //.padding(.horizontal, 24.0)
                    .frame(height: 56)
                    .background(RoundedCorners(color: Color("marshal_red"), tl: 0, tr: 12, bl: 0, br: 12))
    
            }
            .frame(minWidth: 0.0, maxWidth: .infinity)
            .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color("marshal_red"), lineWidth: 2.0)
            )
            .padding(.horizontal, 32.0)
            
            HStack (spacing: 8){
                
                HStack(spacing: 8) {
                    Text("۰۰۰,۰۰۰")
                        .foregroundColor(Color("marshal_White"))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
 
                    Text("بدهی")
                        .foregroundColor(Color("marshal_red"))
                        .font(Font.custom("IRANSansMobileFaNum Bold", size: 14))
                }
                .cornerRadius(12.0)
                .frame(minWidth: 0.0, maxWidth: .infinity)
                .frame(height: 48.0)
                .background(Color("marshal_surfGrey"))
                .cornerRadius(12.0)
                .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("marshal_White"), lineWidth:0.5)
                )
                
                HStack(spacing: 8) {
                    Text("۰۰۰,۰۰۰")
                        .foregroundColor(Color("marshal_White"))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                        
                    
                    Text("اعتبار")
                        .foregroundColor(Color("marshal_red"))
                        .font(Font.custom("IRANSansMobileFaNum Bold", size: 14))

                }
                .cornerRadius(12.0)
                .frame(minWidth: 0.0, maxWidth: .infinity)
                .frame(height: 48.0)
                .background(Color("marshal_surfGrey"))
                .cornerRadius(12.0)
                .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("marshal_White"), lineWidth:0.5)
                )
       
            }
            .padding(.horizontal, 32.0)
            //.padding(.horizontal, 16.0)
            
            ScrollView {
                VStack {
                    Text("اسکرول ویو ↓")
                        .foregroundColor(Color("marshal_White"))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 20))
                }
            }
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("marshal_darkGrey"))
    }
}

struct MarshalWalletTabPage_Previews: PreviewProvider {
    static var previews: some View {
        MarshalWalletTabPageModule()
    }
}
