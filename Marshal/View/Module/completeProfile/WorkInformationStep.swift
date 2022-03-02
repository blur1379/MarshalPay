//
//  MarshalCompleteProfileStep5Module.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/12/1400 AP.
//

import SwiftUI

struct WorkInformationStep: View {
    @ObservedObject var user : User
    @State var statusOfSubmitBottom : Status = .none
    @State var code : String = ""
    let pageSet : () -> Void
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
            
            
            MarshalTextField(text: $user.information.workPlaceAddress.fa, title: "نشانی محل کار", isEn: false, keyboardType: .default)
                .padding(.horizontal, 16.0)
            
            

            MarshalTextField(text: $user.information.workPlaceTelephone, title: "تلفن تماس", isEn: false, keyboardType: .numberPad)
                .padding(.horizontal, 16.0)
            
 
            Submit(status: $statusOfSubmitBottom, title: "مرحله بعد") {
                if checkFields(){
                    pageSet()
                }
            }
            
            Spacer().frame(height: 4.0)
 
        }
        
        //.background(Color("marshal_darkGrey"))

    }
    func checkFields() -> Bool{
        var isComplated = true
        if user.information.workPlaceAddress.fa == "" {
            isComplated = false
        }
        if user.information.workPlaceTelephone == "" {
            isComplated = false
        }
        
        return isComplated
    }
    
}

struct MarshalCompleteProfileStep5Module_Previews: PreviewProvider {
    static var previews: some View {
        WorkInformationStep(user: User(), pageSet: {})
            .previewLayout(.sizeThatFits)
    }
}
