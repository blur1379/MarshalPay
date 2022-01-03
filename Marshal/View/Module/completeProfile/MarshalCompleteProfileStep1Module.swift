//
//  MarshalCompleteProfileStep1Module.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/11/1400 AP.
//

import SwiftUI

struct MarshalCompleteProfileStep1Module: View {
    var body: some View {
        VStack(alignment: .center, spacing: 16.0) {
            
            MarshalCompleteProfileStepBar()
            
            VStack(alignment: .center, spacing: 24.0) {
                Image("icon_add_a_photo_24dp")
                    .resizable()
                    .frame(width: 56.0, height: 56.0, alignment: .center)
                    .scaledToFit()
                    .foregroundColor(Color("marshal_White"))
                    
                Text("عکس  خود را وارد کنید")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 16.0))
                    .foregroundColor(Color("marshal_White"))

            }
            .frame(maxWidth: .infinity)
            .frame(height: 240.0)
            .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("marshal_White"), lineWidth:0.5))
            
            VStack(alignment: .center, spacing: 24.0) {
                Image("icon_add_a_photo_24dp")
                    .resizable()
                    .frame(width: 56.0, height: 56.0, alignment: .center)
                    .scaledToFit()
                    .foregroundColor(Color("marshal_White"))
                    
                Text("عکس کارت ملی خود را وارد کنید")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 16.0))
                    .foregroundColor(Color("marshal_White"))

            }
            .frame(maxWidth: .infinity)
            .frame(height: 240.0)
            .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("marshal_White"), lineWidth:0.5))
            
            
                
                
            
        }
        //.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("marshal_darkGrey"))
    }
}

struct MarshalCompleteProfileStep1Module_Previews: PreviewProvider {
    static var previews: some View {
        MarshalCompleteProfileStep1Module()
            .previewLayout(.sizeThatFits)
    }
}
