//
//  Login.swift
//  Marshal
//
//  Created by Blur on 12/24/21.
//

import SwiftUI

struct Login: View {
    //MARK: - PROPERTIES
    @State private var phoneNumber : String = ""
    @State private var countryCode : String = ""
    @State private var code : String = ""
    @State var timeRemaining = 120
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    //MARK: - BODY
    var body: some View {
        VStack(spacing: 40){
        //: PHONE NUMBER
            MarshalPhoneNumber(phoneNumber: phoneNumber, countryCode: countryCode)
        //: VERIFICATION CODE
            VStack{
                MarshalTextField(text: $code, title: "کد تایید را وارد کنید", isEn: false, keyboardType: .numberPad)
                HStack{
                    
                    Text("\(timeRemaining/60) : \(timeRemaining % 60)")
                        .padding(.horizontal)
                        .foregroundColor(Color.white)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 12))
                             .onReceive(timer) { _ in
                                 if timeRemaining > 0 {
                                     timeRemaining -= 1
                                 }
                             }
                    
                    Spacer()
                }//: HSTACK
            }//: VSTACK
        //: SUBMIT BOTTOM
            Submit(title: "تایید") {
                //pressboton
                print("press")
            }
            
        }//: VSTACK
        .background(Color("marshal_bg"))
    }
}
//MARK: - PREVIEW
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
