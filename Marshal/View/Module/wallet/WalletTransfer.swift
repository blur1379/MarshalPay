//
//  WalletTransfer.swift
//  Marshal
//
//  Created by Moeen Kashisaz on 1/15/22.
//

import SwiftUI

struct WalletTransfer: View {
    //MARK: -PROPERTIES
    @State var statusOfSubmitBottom : Status = .none
    @State var code : String = ""
    @State var isShowInformation = false
    var body: some View {
        VStack(alignment: .center, spacing: 16.0) {
            
            MarshalTextField(text: $code, title: "نوع ارز", isEn: false, keyboardType: .default)
            
            MarshalTextField(text: $code, title: "مبلغ", isEn: false, keyboardType: .default)
            
            MarshalTextField(text: $code, title: "نشانی کیف پول مقصد", isEn: false, keyboardType: .default)

            Submit(status: $statusOfSubmitBottom, title: "تایید") {
                print("press")
            }
            if isShowInformation{
                Group{
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
                }
            }

          
            
            //Spacer()
        }
    }
}

struct WalletTransfer_Previews: PreviewProvider {
    static var previews: some View {
        WalletTransfer()
    }
}
