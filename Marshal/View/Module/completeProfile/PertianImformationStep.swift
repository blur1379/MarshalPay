//
//  MarshalCompleteProfileStep3Module.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/12/1400 AP.
//

import SwiftUI

struct PertianImformationStep: View {
    @ObservedObject var user : User
    @State var statusOfSubmitBottom : Status = .none
    @State var code : String = ""
    let pageSet : () -> Void
    @State var showAlert = false
    var body: some View {
        
        VStack(alignment: .center, spacing: 16.0) {
            
            Spacer().frame(height: 0.0)

            HStack(alignment: .center, spacing: 16.0) {
                MarshalTextField(text: $user.lastName.fa, title: "نام خانوادگی", isEn: false, keyboardType: .default)
                
                MarshalTextField(text: $user.firstName.fa, title: "نام", isEn: false, keyboardType: .default)
                  
            }
            
            MarshalTextField(text: $user.information.nationalCode, title: "کد ملی", isEn: false, keyboardType: .numberPad,limitedItem: 10)
            
            HStack(alignment: .center, spacing: 16.0) {
                MarshalTextField(text: $user.information.jab.fa, title: "شغل", isEn: false, keyboardType: .default)
                
                MarhalDateOfBirth(isEn: false, dateOfBirth: $user.information.birthDate)
                  
            }
                
                MarshalTextField(text: $user.information.residenceTelephone, title: "شماره تلفن ثابت", isEn: false, keyboardType: .numberPad)
                  
            
            
            HStack(alignment: .center, spacing: 16.0) {
                MarshalTextField(text: $user.information.city.fa, title: "شهرستان", isEn: false, keyboardType: .numberPad)
                
                MarshalTextField(text: $user.information.state.fa, title: "استان", isEn: false, keyboardType: .numberPad)
                  
            }
 
            MarshalTextField(text: $user.information.residenceAddress.fa, title: "نشانی پستی", isEn: false, keyboardType: .default)
            
            MarshalTextField(text: $user.information.residencePostalCode, title: "کد پستی", isEn: false, keyboardType: .numberPad)
            
            Group {
                
                Submit(status: $statusOfSubmitBottom, title: "مرحله بعد") {
                    if checkFields(){
                        pageSet()
                    }else{
                        showAlert = true
                    }
                    
                }   .alert(isPresented: $showAlert ) {
                    Alert(title: Text(""), message: Text("لطفا تمامی فیلد ها را پر کنید  "), dismissButton: .default(Text("باشه")) )
                }
                
                    
                Spacer().frame(height: 4.0)
                
            }
 
        }
        .padding(.horizontal, 16.0)
        //.background(Color("marshal_darkGrey"))
    }
    
    
    //MARK: -FUNCTION
    func checkFields() -> Bool{
        var isComplated = true
        if user.lastName.fa == "" {
            isComplated = false
        }
        if user.firstName.fa == "" {
            isComplated = false
        }
        if user.information.nationalCode == "" {
            isComplated = false
        }
        if user.information.jab.fa == "" {
            isComplated = false
        }
        if user.information.birthDate == "" {
            isComplated = false
        }
        if user.information.residenceTelephone == "" {
            isComplated = false
        }
        if user.information.city.fa == "" {
            isComplated = false
        }
        if user.information.state.fa == "" {
            isComplated = false
        }
        if user.information.residenceAddress.fa == "" {
            isComplated = false
        }
        if user.information.residencePostalCode == "" {
            isComplated = false
        }
        
        return isComplated
    }
}

struct MarshalCompleteProfileStep3Module_Previews: PreviewProvider {
    static var previews: some View {
        PertianImformationStep(user: User(), pageSet: {})
            .previewLayout(.sizeThatFits)
    }
}
