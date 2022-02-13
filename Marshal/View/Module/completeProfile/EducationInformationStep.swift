//
//  MarshalCompleteProfileStep6Module.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/12/1400 AP.
//

import SwiftUI

struct EducationInformationStep: View {
    
    @State var statusOfSubmitBottom : Status = .none
    @State var code : String = ""
    let pageSet : () -> Void
    var body: some View {
        VStack(alignment: .center, spacing: 16.0) {
            
            Spacer().frame(height: 0.0)

            VStack(alignment: .center, spacing: 16.0) {
                
                HStack {
                    
                    Spacer()
                    
                    Text("وضعیت تحصیلی :")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 20.0))
                        .foregroundColor(Color("marshal_White"))
                        .multilineTextAlignment(.trailing)
                    
                }
                
                .padding(.horizontal, 16.0)
                
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
                            Text("فارغ تحصیل")
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                                .foregroundColor(Color("marshal_White"))
                                .multilineTextAlignment(.trailing)
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(Color("marshal_White"))
                        }
                        .frame(maxWidth: .infinity)
                    }
 
                }
                
                .padding(.horizontal, 16.0)
                
            }

            MarshalTextField(text: $code, title: "آخرین مدرک تحصیلی", isEn: false, keyboardType: .default)
                .padding(.horizontal, 16.0)
            
            

            MarshalTextField(text: $code, title: "رشته تحصیلی", isEn: false, keyboardType: .numberPad)
                .padding(.horizontal, 16.0)
            
            MarshalTextField(text: $code, title: "آخرین دانشگاه محل تحصیل", isEn: false, keyboardType: .numberPad)
                .padding(.horizontal, 16.0)
            
            
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
            .frame(width: UIScreen.main.bounds.width - 32, height: (UIScreen.main.bounds.width - 32) * 2/3)
            .background(Color("marshal_surfGrey"))
            .cornerRadius(12.0)
            .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("marshal_White"), lineWidth:0.5))
 
            Submit(status: $statusOfSubmitBottom, title: "مرحله بعد") {
                print("press")
            }
            
            Spacer().frame(height: 4.0)
 
        }
        //.background(Color("marshal_darkGrey"))

    }
}

struct MarshalCompleteProfileStep6Module_Previews: PreviewProvider {
    static var previews: some View {
        EducationInformationStep(pageSet: {})
            .previewLayout(.sizeThatFits)
    }
}
