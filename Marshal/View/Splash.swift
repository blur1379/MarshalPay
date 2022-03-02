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
          
                         
            }//: VSTACK
        }//: ZSTACK
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
