//
//  NetworkFailed.swift
//  Marshal
//
//  Created by Blur on 12/24/21.
//

import SwiftUI

struct NetworkFailed: View {
    var body: some View {
        VStack{
             Spacer()
             Button(action: {
                 
             }) {
                 Text("اتصال اینترنت خود را برسی کنید.")
                     .font(Font.custom("IRANSansMobileNoEn Medium", size: 12))
                     .frame(maxWidth: .infinity, alignment: .center)
                     .background(Color("marshal_bg"))
                     .foregroundColor(Color("marshal_red"))
             }
             Spacer()
         }
    }
}

struct NetworkFailed_Previews: PreviewProvider {
    static var previews: some View {
        NetworkFailed()
    }
}
