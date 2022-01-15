//
//  WalletDeposit.swift
//  Marshal
//
//  Created by Moeen Kashisaz on 1/15/22.
//

import SwiftUI

struct WalletDeposit: View {
    //MARK: -PEROPERTIES
    @State var statusOfSubmitBottom : Status = .none
    //MARK: -BODY
    var body: some View {
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
}
//MARK: -PREVIEW
struct WalletDeposit_Previews: PreviewProvider {
    static var previews: some View {
        WalletDeposit()
    }
}
