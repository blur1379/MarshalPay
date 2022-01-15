//
//  MarshalWalletTabPageModule.swift
//  Marshal
//
//  Created by Blur on 10/21/1400 AP.
//

import SwiftUI

struct MarshalWalletTabPageModule: View {
    enum pageOfWallet{
        case withdraw
        case deposit
        case transfer
    }
    @State var code : String = ""
    @State var wallet = WalletModel()
    @State var statusOfSubmitBottom : Status = .none
    
    var tabsOnTop: some View {
        
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
        
    }
    
    var balaceBlock: some View {
        
        VStack (spacing: 16){
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

                Text(wallet.getCurrentCredit())
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
                    Text(wallet.getDebtCredit())
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
                    Text(wallet.getValidityCredit())
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
            .padding(.bottom, 16)
            //.padding(.horizontal, 16.0)
            
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("marshal_darkGrey"),Color("marshal_Grey")]), startPoint: .top, endPoint: .bottom))
        
    }
    
    var priceList: some View {

        ScrollView {
            LazyVStack {
                ForEach(wallet.walletCurencies){walletCurrency in
                    WalletRowModule(walletCurrency: walletCurrency)
                }
            }
        }
    }
    
    var withdrawTab: some View {
        
        VStack(alignment: .center, spacing: 16.0) {
            HStack(alignment: .center, spacing: 16.0) {
                
                MarshalTextField(text: $code, title: "انتخاب ارز", isEn: false, keyboardType: .default)
                
                MarshalTextField(text: $code, title: "نام بانک", isEn: false, keyboardType: .default)
            }
            
            MarshalTextField(text: $code, title: "نام صاحب حساب", isEn: false, keyboardType: .default)
            
            MarshalTextField(text: $code, title: "شماره حساب", isEn: false, keyboardType: .default)
            
            MarshalTextField(text: $code, title: "مبلغ", isEn: false, keyboardType: .default)

            Submit(status: $statusOfSubmitBottom, title: "مرحله بعد") {
                print("press")
            }
            //Spacer()
        }
 
    }
    
    var depositTab: some View {
        
        VStack(alignment: .center, spacing: 16.0) {
            
            VStack(alignment: .center, spacing: 24.0) {
                Image("icon_add_a_photo_24dp")
                    .resizable()
                    .frame(width: 56.0, height: 56.0, alignment: .center)
                    .scaledToFit()
                    .foregroundColor(Color("marshal_White"))
                    
                Text("عکس کارت ملی خود را وارد کنید")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 16.0))
                    .foregroundColor(Color("marshal_White"))
            }
            .frame(width: UIScreen.main.bounds.width - 32, height: (UIScreen.main.bounds.width - 32) * 2/3)
            .background(Color("marshal_surfGrey"))
            .cornerRadius(12.0)
            .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("marshal_White"), lineWidth:0.5))
            
            Submit(status: $statusOfSubmitBottom, title: "مرحله بعد") {
                print("press")
            }
            //Spacer()
            
        }

    }
    
    var transferTab: some View {
        
        VStack(alignment: .center, spacing: 16.0) {
            
            MarshalTextField(text: $code, title: "نوع ارز", isEn: false, keyboardType: .default)
            
            MarshalTextField(text: $code, title: "مبلغ", isEn: false, keyboardType: .default)
            
            MarshalTextField(text: $code, title: "نشانی کیف پول مقصد", isEn: false, keyboardType: .default)

            Submit(status: $statusOfSubmitBottom, title: "تایید") {
                print("press")
            }
            
            VStack(alignment: .center, spacing: 32.0) {
                
                HStack(alignment: .center, spacing: 16.0) {
                    
                    Spacer()
                    
                    Text("نام و نام خانوادگی حساب")
                        .foregroundColor(Color("marshal_soWhite"))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 18.0))
                    
                    Text("به حساب :")
                        .foregroundColor(Color("marshal_White"))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
     
                }
                
                HStack {
                    
                    HStack(alignment: .center, spacing: 16.0) {
                        
                        Text("۰۰۰,۰۰۰")
                            .foregroundColor(Color("marshal_soWhite"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 18.0))
                        
                        Text("مانده حساب :")
                            .foregroundColor(Color("marshal_red"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                    }
                    
                    Spacer()
                    
                    HStack(alignment: .center, spacing: 16.0) {
                        
                        Text("۰۰۰,۰۰۰")
                            .foregroundColor(Color("marshal_soWhite"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 18.0))
                        
                        Text("کارمزد :")
                            .foregroundColor(Color("marshal_red"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                    }
 
            }
    
            }
            .padding(.all, 24.0)
            .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color("marshal_red"), lineWidth:0.5)
            )
            //.offset(y: 16)
            
            Submit(status: $statusOfSubmitBottom, title: "انتقال ارز") {
                print("press")
            }
            
            //Spacer()
        }
    }
    
    
    var body: some View {
        VStack (alignment: .center, spacing: 32.0){
            
            tabsOnTop
            balaceBlock
            priceList
            //withdrawTab
            //depositTab
            //transferTab
            
            Spacer()
 
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .padding(.horizontal, 16.0)
        .padding(.top, 16.0)
        
    }
}


struct MarshalWalletTabPageModule_Previews: PreviewProvider {
    static var previews: some View {
        MarshalWalletTabPageModule()
    }
}
