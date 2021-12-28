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
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    //MARK: - BODY
    var body: some View {
        VStack(spacing: 16){
        //: PHONE NUMBER
            MarshalPhoneNumber(phoneNumber: phoneNumber, countryCode: countryCode)
        //: VERIFICATION CODE
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
        //: SUBMIT BOTTOM
            Submit(title: "تایید") {
                //pressboton
                print("press")
            }
            
        }
        .padding(.horizontal, 16.0)//: VSTACK
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("marshal_darkGrey"))
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
