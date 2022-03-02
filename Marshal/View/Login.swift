//
//  Login.swift
//  Marshal
//
//  Created by Blur on 12/24/21.
//

import SwiftUI

struct Login: View {
    //MARK: - PROPERTIES
    @AppStorage("showLogin") var showLogin = false
    @State var phoneNumber : String = ""
    @State var countryCode : String = "98"
    @State var code : String = ""
    @State var timeRemaining = 120
    @State var isShowCode = false
    @State var status : Status = .none
    @State var alertText : String = ""
    @State var showAlert : Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let callapi = CallApi()

    
    var topBar : some View {
        HStack(alignment: .center) {
            Button {
               showLogin = false
            } label: {
                Image (systemName: "arrow.backward")
                    .frame(width: 40, height: 40, alignment: .leading)
                    .foregroundColor(Color("marshal_red"))
                    .imageScale(.large)
            }

  

            Spacer()
            
            Text("صرافی")
                
                .foregroundColor(Color("marshal_White"))
                .font(Font.custom("IRANSansMobileFaNum Bold", size: 18))
            
            
            
            
//            Image ("marshal_logo-wings")
//                .resizable()
//                .frame(width: 96, height: 22, alignment: .center)
//                .scaledToFit()
            
  
        }
        .padding(.horizontal, 16.0)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 56)

    }
    
    
    //MARK: - BODY
    var body: some View {
        VStack(spacing: 16){
            VStack(spacing: 0){
                topBar
                Divider()
                    .frame(height:1)
                    .background(Color("marshal_red"))
            }
           
                
                
            VStack {
                VStack(alignment: .center, spacing: 8){
                    //LOGO
                    Image("marshal_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 192, alignment: .center)
                    // DIVIDER
                    Divider()
                        .frame(width: 192,height: 1.0)
                        .background(Color("marshal_red"))
                    
                    //TITLE
                    Text("بازار آنلاین رمزارز ها")
                        .foregroundColor(Color("marshal_White"))
                        .font(Font.custom("IRANSansMobileNoEn Medium", size: 20))
                        
                }//: VSTACK
          
                         
            }//: VSTACK
            .padding(.bottom , 50)

         
        //: PHONE NUMBER
            MarshalPhoneNumber(phoneNumber: $phoneNumber, countryCode: countryCode)
                .padding(.horizontal, 16)
                .alert(alertText, isPresented: $showAlert) {
                    Button("باشه", role: .cancel) { }
                }
        //: VERIFICATION CODE
            if isShowCode {
                VStack{
                    MarshalTextField(text: $code, title: "کد تایید را وارد کنید", isEn: false, keyboardType: .numberPad,limitedItem: 6)
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
                .padding(.horizontal, 16.0)
                .onChange(of: phoneNumber) { newValue in
                    isShowCode = false
                }
            }// : END IF
        //: SUBMIT BOTTOM
  
            Submit(status: $status, title: "تایید") {
                submit()
            }
            Spacer()
         }
        //: VSTACK
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("marshal_darkGrey"))
        .edgesIgnoringSafeArea(.bottom)
        .onTapGesture {
            hideKeyboard()
        }
    }
    //MARK: -FUNCTION
    func submit() {
        if phoneNumber.count > 9 {
            if isShowCode {
              enterCode()
            }else{
             enterPhoneNumber()
            }
        }else{
            faildAlert(alertText: "شماره خود را به درستی وارد کنید.")
        }
    }
    
    func enterPhoneNumber(){
        status = .InProgress
        callapi.SendActivationCode(phoneNumber: countryCode + phoneNumber) { status in
            self.status = status
            if status == .Successful {
                isShowCode = true
            }else if status == .Failure {
                faildAlert(alertText: "لطفا مجدد تلاش کنید")
            }
        }
    }
    func enterCode(){
        status = .InProgress
        callapi.sendVerificstionCode(phoneNumber:countryCode + phoneNumber, verificationCode: code) { status in
            self.status = status
            if status == .Successful{
                // go to home
            }else if status == .Failure {
                faildAlert(alertText: "کد اشتباه است یا منقضی شده است")
            }
        }
    }
    func faildAlert(alertText: String ){
        self.alertText = alertText
        showAlert = true
        
    }
}
//MARK: - PREVIEW
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Login()
                .background(Color("marshal_darkGrey"))
                
            
        }
    }
}
