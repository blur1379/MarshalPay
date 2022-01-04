//
//  MarshalTrendTabPageModule.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/14/1400 AP.
//

import SwiftUI

struct MarshalTrendTabPageModule: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0.0) {
            HStack{
                Group{
                    Text("تغییر 24 ساعته")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                        .foregroundColor(Color("marshal_White"))
                        .frame(height: 48.0)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        //.padding(.vertical, 8)
                }//:GROUP
                
                Divider()
                    .frame(width: 1.0, height: 32)
                    .background(Color("marshal_White"))
                
                Group{
                    Text("آخرین قیمت")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                        .foregroundColor(Color("marshal_White"))
                        .frame(height: 48.0)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        //.padding(.vertical, 8)
                }//:GROUP
                
                Divider()
                    .frame(width: 1.0, height: 32)
                    .background(Color("marshal_White"))
                
                
                Group{
                    Text("ارز")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                        .foregroundColor(Color("marshal_White"))
                        .frame(height: 48.0)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        //.padding(.vertical, 8)
                }//:GROUP
                
            }
            
            Divider()
                .frame(height: 1.0).background(Color("marshal_White"))

            ScrollView {
                VStack {
                    Text("اسکرول ویو ↓")
                        .foregroundColor(Color("marshal_White"))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 20))
                }
            }
            .padding(.top, 16.0)

        }
        .background(Color("marshal_darkGrey"))
        .frame(minHeight: 0.0, maxHeight: .infinity, alignment: .center)
    }
}

struct MarshalTrendTabPageModule_Previews: PreviewProvider {
    static var previews: some View {
        MarshalTrendTabPageModule()
    }
}
