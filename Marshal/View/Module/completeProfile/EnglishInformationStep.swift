//
//  MarshalCompleteProfileStep4Module.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/12/1400 AP.
//

import SwiftUI

struct EnglishInformationStep: View {
    @ObservedObject var user : User
    @State var statusOfSubmitBottom : Status = .none
    @State var code : String = ""
    let pageSet : () -> Void
    @State var showAlert = false
    var body: some View {
        VStack(alignment: .center, spacing: 16.0) {
            
            Spacer().frame(height: 0.0)
            
            HStack(alignment: .center, spacing: 16.0) {
                MarshalTextField(text: $user.firstName.en, title: "Name", isEn: true, keyboardType: .default)
                
                MarshalTextField(text: $user.lastName.en, title: "Family name", isEn: true, keyboardType: .default)
                  
            }
            
            MarshalTextField(text: $user.information.nationalCode, title: "National Code", isEn: true, keyboardType: .numberPad)
            
            HStack(alignment: .center, spacing: 16.0) {
                MarhalDateOfBirth(isEn: true, dateOfBirth: $user.information.birthDate)
                
                MarshalTextField(text: $user.information.jab.en, title: "Job title", isEn: true, keyboardType: .default)
                  
            }
            
       
            MarshalTextField(text: $user.information.residenceTelephone, title: "Tel number", isEn: true, keyboardType: .numberPad,limitedItem: 11)
                
             
                  
            
            
            HStack(alignment: .center, spacing: 16.0) {
                MarshalTextField(text: $user.information.state.en, title: "Province", isEn: true, keyboardType: .default)
                
                MarshalTextField(text: $user.information.city.en, title: "City", isEn: true, keyboardType: .default)
                  
            }
            
            
            
            MarshalTextField(text: $user.information.residenceAddress.en, title: "Address", isEn: true, keyboardType: .default)
            
            MarshalTextField(text: $user.information.residencePostalCode, title: "Postal code", isEn: true, keyboardType: .numberPad)
            
            Group {
                
                Submit(status: $statusOfSubmitBottom, title: "مرحله بعد") {
                    if checkFields(){
                        pageSet()
                    }else{
                        showAlert = true
                    }
                    
                } .alert(isPresented: $showAlert ) {
                    Alert(title: Text(""), message: Text("لطفا تمامی فیلد ها را پر کنید  "), dismissButton: .default(Text("باشه")) )
                }
                    
                Spacer().frame(height: 4.0)
                
            }
            
        }
        .padding(.horizontal, 16.0)
        //.background(Color("marshal_darkGrey"))

    }
    func checkFields() -> Bool{
        var isComplated = true
        if user.lastName.en == "" {
            isComplated = false
        }
        if user.firstName.en == "" {
            isComplated = false
        }
        if user.information.nationalCode == "" {
            isComplated = false
        }
        if user.information.jab.en == "" {
            isComplated = false
        }
        if user.information.birthDate == "" {
            isComplated = false
        }
        if user.information.residenceTelephone == "" {
            isComplated = false
        }
        if user.information.city.en == "" {
            isComplated = false
        }
        if user.information.state.en == "" {
            isComplated = false
        }
        if user.information.residenceAddress.en == "" {
            isComplated = false
        }
        if user.information.residencePostalCode == "" {
            isComplated = false
        }
        
        return isComplated
    }
    
}

struct MarshalCompleteProfileStep4Module_Previews: PreviewProvider {
    static var previews: some View {
        EnglishInformationStep(user: User(), pageSet: {})
            .previewLayout(.sizeThatFits)
    }
}
