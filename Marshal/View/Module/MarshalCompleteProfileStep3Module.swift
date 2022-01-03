//
//  MarshalCompleteProfileStep3Module.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/12/1400 AP.
//

import SwiftUI

struct MarshalCompleteProfileStep3Module: View {
    
    @State var statusOfSubmitBottom : Status = .none
    @State var code : String = ""
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 16.0) {
            
            
            HStack(alignment: .center, spacing: 16.0) {
                MarshalTextField(text: $code, title: "نام خانوادگی", isEn: false, keyboardType: .default)
                
                MarshalTextField(text: $code, title: "نام", isEn: false, keyboardType: .default)
                  
            }
            
            MarshalTextField(text: $code, title: "کد ملی", isEn: false, keyboardType: .numberPad)
            
            HStack(alignment: .center, spacing: 16.0) {
                MarshalTextField(text: $code, title: "شغل", isEn: false, keyboardType: .default)
                
                MarshalTextField(text: $code, title: "تاریخ تولد", isEn: false, keyboardType: .default)
                  
            }

            MarshalTextField(text: $code, title: "شماره تلفن همراه", isEn: false, keyboardType: .numberPad)
            
            HStack(alignment: .center, spacing: 16.0) {
                MarshalTextField(text: $code, title: "کد شهر", isEn: false, keyboardType: .numberPad)
                
                MarshalTextField(text: $code, title: "شماره تلفن ثابت", isEn: false, keyboardType: .numberPad)
                  
            }
            
            HStack(alignment: .center, spacing: 16.0) {
                MarshalTextField(text: $code, title: "شهرستان", isEn: false, keyboardType: .numberPad)
                
                MarshalTextField(text: $code, title: "استان", isEn: false, keyboardType: .numberPad)
                  
            }
            
            
            
            MarshalTextField(text: $code, title: "نشانی پستی", isEn: false, keyboardType: .default)
            
            MarshalTextField(text: $code, title: "کد پستی", isEn: false, keyboardType: .numberPad)
            
            Submit(status: $statusOfSubmitBottom, title: "مرحله بعد") {
                print("press")
            }
                
                
            
        }
        .background(Color("marshal_darkGrey"))
    }
}

struct MarshalCompleteProfileStep3Module_Previews: PreviewProvider {
    static var previews: some View {
        MarshalCompleteProfileStep3Module()
            .previewLayout(.sizeThatFits)
    }
}
