//
//  MarshalTopBarType01.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/9/1400 AP.
//

import SwiftUI

struct MarshalTopBarType01: View {
    @Binding var page : HomePages
    var body: some View {
        HStack(alignment: .center) {
//            Image (systemName: "arrow.backward")
//                .frame(width: 40, height: 40, alignment: .leading)
//                .foregroundColor(Color("marshal_red"))
//                .imageScale(.large)

            Text(ConstantData().homePageTitle(page: page))
                
                .foregroundColor(Color("marshal_White"))
                .font(Font.custom("IRANSansMobileFaNum Bold", size: 18))
            
            
            Spacer()
            
            Image ("marshal_logo-wings")
                .resizable()
                .frame(width: 96, height: 22, alignment: .center)
                .scaledToFit()
            
  
        }
        .padding(.horizontal, 16.0)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 56)
    }
}

struct MarshalTopBarType01_Previews: PreviewProvider {
    static var previews: some View {
        MarshalTopBarType01(page: .constant(.Exchange))
            .previewLayout(.sizeThatFits)
    }
}
