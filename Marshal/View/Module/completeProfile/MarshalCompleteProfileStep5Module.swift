//
//  MarshalCompleteProfileStep5Module.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/12/1400 AP.
//

import SwiftUI

struct MarshalCompleteProfileStep5Module: View {
    
    @State var statusOfSubmitBottom : Status = .none
    @State var code : String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 16.0) {
            
            Spacer().frame(height: 0.0)
            HStack {
                
                Spacer()
                
                Text("وضعیت شغلی :")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 20.0))
                    .foregroundColor(Color("marshal_White"))
                    .multilineTextAlignment(.trailing)
                
            }
            .padding(.horizontal, 16.0)
            
            
            MarshalTextField(text: $code, title: "نشانی محل کار", isEn: false, keyboardType: .default)
                .padding(.horizontal, 16.0)
            
            

            MarshalTextField(text: $code, title: "تلفن تماس", isEn: false, keyboardType: .numberPad)
                .padding(.horizontal, 16.0)
            
            
            VStack(alignment: .center, spacing: 24.0) {
                Image("icon_add_a_photo_24dp")
                    .resizable()
                    .frame(width: 56.0, height: 56.0, alignment: .center)
                    .scaledToFit()
                    .foregroundColor(Color("marshal_White"))
                    
                Text("تصویر مدارک شغلی خود را وارد کنید")
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
            
            Spacer().frame(height: 4.0)
 
        }
        
        //.background(Color("marshal_darkGrey"))

    }
}

struct MarshalCompleteProfileStep5Module_Previews: PreviewProvider {
    static var previews: some View {
        MarshalCompleteProfileStep5Module()
            .previewLayout(.sizeThatFits)
    }
}
