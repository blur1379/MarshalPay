//
//  Splash.swift
//  Marshal
//
//  Created by Blur on 12/24/21.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
struct Splash: View {
    //MARK: - PROPERTIES
    @StateObject var networkConnection = NetworkManeger()
    @State var showLogin = false
    //MARK: - BODY
    var body: some View {
        
        ZStack {
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
                if networkConnection.isConnected {
                    if showLogin {
                        VStack{
                            Login()
                                .frame(height: 400, alignment: .center)
                        }//: VSTACK
                    }else{
                        // go to home
                        
                    }//: END IF
                }else{
                    // connection failed
                    NetworkFailed()
                }//: END IF
            }//: VSTACK
            .animation(.easeIn, value: showLogin)
        }//: ZSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                      showLogin = true
                  }
        })
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .ignoresSafeArea()
        .background(Color("marshal_darkGrey"))
        .onTapGesture {
            hideKeyboard()
        }
    }
}
//MARK: - PREVIEW
struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
