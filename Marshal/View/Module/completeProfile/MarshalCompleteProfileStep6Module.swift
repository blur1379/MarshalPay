//
//  MarshalCompleteProfileStep6Module.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/12/1400 AP.
//

import SwiftUI

struct MarshalCompleteProfileStep6Module: View {
    
    @State var code : String = ""

    
    var body: some View {
        VStack(alignment: .center, spacing: 16.0) {
            
            MarshalCompleteProfileStepBar()
            
            VStack(alignment: .center, spacing: 16.0) {
                
                HStack {
                    
                    Spacer()
                    
                    Text("وضعیت تحصیلی :")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 20.0))
                        .foregroundColor(Color("marshal_White"))
                        .multilineTextAlignment(.trailing)
                    
                }
                
                HStack(alignment: .center, spacing: 16.0) {
                    
                    
                    
                    HStack(alignment: .center) {
                        
                        HStack {
                            Text("انصراف")
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                                .foregroundColor(Color("marshal_White"))
                                .multilineTextAlignment(.trailing)
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(Color("marshal_White"))
                        }
                        .frame(maxWidth: .infinity)
                        
                        HStack {
                            Text("دانشجو")
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                                .foregroundColor(Color("marshal_White"))
                                .multilineTextAlignment(.trailing)
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(Color("marshal_White"))
                        }
                        .frame(maxWidth: .infinity)
                        
                        HStack {
                            Text("دانشجو")
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                                .foregroundColor(Color("marshal_White"))
                                .multilineTextAlignment(.trailing)
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(Color("marshal_White"))
                        }
                        .frame(maxWidth: .infinity)
                    }
                    
                   
                    

                    
                }
                
            }
            

            
            MarshalTextField(text: $code, title: "آخرین مدرک تحصیلی", isEn: false, keyboardType: .default)
            
            

            MarshalTextField(text: $code, title: "رشته تحصیلی", isEn: false, keyboardType: .numberPad)
            
            MarshalTextField(text: $code, title: "آخرین دانشگاه محل تحصیل", isEn: false, keyboardType: .numberPad)
            
            
            VStack(alignment: .center, spacing: 24.0) {
                Image("icon_add_a_photo_24dp")
                    .resizable()
                    .frame(width: 56.0, height: 56.0, alignment: .center)
                    .scaledToFit()
                    .foregroundColor(Color("marshal_White"))
                    
                Text("تصویر مدارک تحصیلی خود را وارد کنید")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 16.0))
                    .foregroundColor(Color("marshal_White"))

            }
            .frame(maxWidth: .infinity)
            .frame(height: 240.0)
            .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("marshal_White"), lineWidth:0.5))
 
            //Submit(status: <#T##Status#>, title: <#T##String#>, onClick: <#T##() -> Void#>, body: <#T##View#>)
 
        }
        .background(Color("marshal_darkGrey"))

    }
}

struct MarshalCompleteProfileStep6Module_Previews: PreviewProvider {
    static var previews: some View {
        MarshalCompleteProfileStep6Module()
            .previewLayout(.sizeThatFits)
    }
}
