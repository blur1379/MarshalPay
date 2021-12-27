//
//  Splash.swift
//  Marshal
//
//  Created by Blur on 12/24/21.
//

import SwiftUI


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
                        .frame(width: 189, alignment: .center)
                    // DIVIDER
                    Divider()
                        .frame(width: 189,height: 1.0)
                        .background(Color("marshal_red"))
                    
                    //TITLE
                    Text("بازار آنلاین رمز ارز ها")
                        .foregroundColor(Color.white)
                        .font(Font.custom("IRANSansMobileNoEn Medium", size: 21))
                        
                }//: VSTACK
                if networkConnection.isConnected {
                    if showLogin {
                        VStack{
                            
                        }//: VSTACK
                    }else{
                        // go to home
                        
                    }//: END IF
                }else{
                    // connection failed
                    NetworkFailed()
                }//: END IF
            }//: VSTACK
        }//: ZSTACK
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 7.5) {
                      showLogin = true
                  }
        })
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .ignoresSafeArea()
        .background(Color("marshal_bg"))
    }
}
//MARK: - PREVIEW
struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
