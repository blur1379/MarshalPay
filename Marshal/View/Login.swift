//
//  Login.swift
//  Marshal
//
//  Created by Blur on 12/24/21.
//

import SwiftUI

struct Login: View {
    //MARK: - PROPERTIES
    @State var phoneNumber : String = ""
    @State var countryCode : String = "98"
    @State var code : String = ""
    @State var timeRemaining = 120
    @State var isShowCode = false
    @State var status : Status = .none
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let callapi = CallApi()

    //MARK: - BODY
    var body: some View {
        VStack(spacing: 16){
            
            Spacer()
            
        //: PHONE NUMBER
            MarshalPhoneNumber(phoneNumber: $phoneNumber, countryCode: countryCode)
        //: VERIFICATION CODE
            if isShowCode {
                VStack{
                    MarshalTextField(text: $code, title: "کد تایید را وارد کنید", isEn: false, keyboardType: .numberPad)
                    HStack{
        
                        Text("\(timeRemaining/60) : \(timeRemaining % 60)")
                            .padding(.leading, 16.0)
                            .foregroundColor(Color("marshal_White"))
                            .font(Font.custom("IRANSansMobileFaNum Light", size: 14))
                                 .onReceive(timer) { _ in
                                     if timeRemaining > 0 {
                                         timeRemaining -= 1
                                     }
                                 }
                        Spacer()
                    }//: HSTACK
                }//: VSTACK
            }// : END IF
        //: SUBMIT BOTTOM
            Submit(status: $status, title: "تایید") {
                if phoneNumber.count > 9 {
                    if isShowCode {
                        
                    }else{
                        callapi.SendActivationCode(phoneNumber: countryCode + phoneNumber) { status in
                            self.status = status
                            if status == .Successful {
                                isShowCode = true
                            }
                        }
                    }
                }
            
            }
            
            Spacer()
 
        }
        //: VSTACK
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("marshal_darkGrey"))
        .edgesIgnoringSafeArea(.all)
    }
       
}
//MARK: - PREVIEW
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Login()
                
            
        }
    }
}
