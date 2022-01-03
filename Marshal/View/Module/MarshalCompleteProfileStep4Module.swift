//
//  MarshalCompleteProfileStep4Module.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/12/1400 AP.
//

import SwiftUI

struct MarshalCompleteProfileStep4Module: View {
    
    @State var statusOfSubmitBottom : Status = .none
    @State var code : String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 16.0) {
            
            
            HStack(alignment: .center, spacing: 16.0) {
                MarshalTextField(text: $code, title: "Name", isEn: true, keyboardType: .default)
                
                MarshalTextField(text: $code, title: "Family name", isEn: true, keyboardType: .default)
                  
            }
            
            MarshalTextField(text: $code, title: "National Code", isEn: true, keyboardType: .numberPad)
            
            HStack(alignment: .center, spacing: 16.0) {
                MarshalTextField(text: $code, title: "Date of birth", isEn: true, keyboardType: .default)
                
                MarshalTextField(text: $code, title: "Job title", isEn: true, keyboardType: .default)
                  
            }

            MarshalTextField(text: $code, title: "Mobile phone number", isEn: true, keyboardType: .numberPad)
            
            HStack(alignment: .center, spacing: 16.0) {
                MarshalTextField(text: $code, title: "Tel number", isEn: true, keyboardType: .numberPad)
                
                MarshalTextField(text: $code, title: "Tel number code", isEn: true, keyboardType: .numberPad)
                  
            }
            
            HStack(alignment: .center, spacing: 16.0) {
                MarshalTextField(text: $code, title: "Province", isEn: true, keyboardType: .numberPad)
                
                MarshalTextField(text: $code, title: "City", isEn: true, keyboardType: .numberPad)
                  
            }
            
            
            
            MarshalTextField(text: $code, title: "Address", isEn: true, keyboardType: .default)
            
            MarshalTextField(text: $code, title: "Postal code", isEn: true, keyboardType: .numberPad)
            
            Submit(status: $statusOfSubmitBottom, title: "مرحله بعد") {
                print("press")
            }
                
                
            
        }
        .background(Color("marshal_darkGrey"))

    }
}

struct MarshalCompleteProfileStep4Module_Previews: PreviewProvider {
    static var previews: some View {
        MarshalCompleteProfileStep4Module()
            .previewLayout(.sizeThatFits)
    }
}
