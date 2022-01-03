//
//  MarshalCompleteProfileStep2Module.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/12/1400 AP.
//

import SwiftUI

struct MarshalCompleteProfileStep2Module: View {
    
    @State var statusOfSubmitBottom : Status = .none
    
    var body: some View {
        VStack(alignment: .center, spacing: 16.0) {

            
            Text("سطح کاربری خود را تعیین کنید")
                .font(Font.custom("IRANSansMobileFaNum Medium", size: 24.0))
                .foregroundColor(Color("marshal_White"))
                .multilineTextAlignment(.trailing)
                
            HStack(alignment: .center, spacing: 16.0) {
                
                Spacer()
                
                Text("نقره‌ای")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 20.0))
                    .foregroundColor(Color("marshal_White"))
                    .multilineTextAlignment(.trailing)
                
                Image("icon_badge_24dp")
                    .resizable()
                    .frame(width: 32.0, height: 32.0, alignment: .center)
                
   
            }
            .padding(.horizontal, 16.0)
            .frame(maxWidth: .infinity)
            .frame(height: 56.0)
            .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("marshal_red"), lineWidth:0.5))
            
            HStack(alignment: .center, spacing: 16.0) {
                
                Spacer()
                
                Text("طلایی")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 20.0))
                    .foregroundColor(Color("marshal_White"))
                    .multilineTextAlignment(.trailing)
                
                Image("icon_badge_24dp")
                    .resizable()
                    .frame(width: 32.0, height: 32.0, alignment: .center)
                
   
            }
            .padding(.horizontal, 16.0)
            .frame(maxWidth: .infinity)
            .frame(height: 56.0)
            .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("marshal_red"), lineWidth:0.5))
            
            HStack(alignment: .center, spacing: 16.0) {
                
                Spacer()
                
                Text("الماس")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 20.0))
                    .foregroundColor(Color("marshal_White"))
                    .multilineTextAlignment(.trailing)
                
                Image("icon_badge_24dp")
                    .resizable()
                    .frame(width: 32.0, height: 32.0, alignment: .center)
                
   
            }
            .padding(.horizontal, 16.0)
            .frame(maxWidth: .infinity)
            .frame(height: 56.0)
            .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("marshal_red"), lineWidth:0.5))
            
            Submit(status: $statusOfSubmitBottom, title: "مرحله بعد") {
                print("press")
            }
                
                
            
        }
        .background(Color("marshal_darkGrey"))
    }
}

struct MarshalCompleteProfileStep2Module_Previews: PreviewProvider {
    static var previews: some View {
        MarshalCompleteProfileStep2Module()
    }
}
