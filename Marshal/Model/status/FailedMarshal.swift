//
//  FailedMarshal.swift
//  Marshal
//
//  Created by Blur on 12/24/21.
//

import SwiftUI

struct FailedMarshal: View {
    var repeatFunc : () -> Void
    var body: some View {
       VStack{
            Spacer()
            Button(action: {
             repeatFunc()
                
            }) {
                Text("تلاش مجدد")
                    .foregroundColor(.white)
                    .font(Font.custom("IRANSansMobileNoEn Medium", size: 12))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(Color("marshal_Grey"))
            }
            Spacer()
        }
    }
}

struct FailedMarshal_Previews: PreviewProvider {
    static var previews: some View {
        FailedMarshal(repeatFunc: {})
    }
}
