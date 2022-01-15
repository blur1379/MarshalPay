//
//  WalletWithdraw.swift
//  Marshal
//
//  Created by Moeen Kashisaz on 1/15/22.
//

import SwiftUI

struct WalletWithdraw: View {
    @State var code = ""
    @State var statusOfSubmitBottom : Status = .none
    var body: some View {
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
}

struct WalletWithdraw_Previews: PreviewProvider {
    static var previews: some View {
        WalletWithdraw()
    }
}
