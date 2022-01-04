//
//  ExchangeTopBar.swift
//  Marshal
//
//  Created by Blur on 10/13/1400 AP.
//

import SwiftUI

struct ExchangeTopBar: View {
    //MARK: - PEROPERTIES
    //MARK: - BODY
    var body: some View {
        HStack{
            Group{
                Text("تغییر 24 ساعته")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    .foregroundColor(Color("marshal_White"))
                    .padding(.vertical, 8)
            }//:GROUP
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            Group{
                Text("آخرین قیمت")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    .foregroundColor(Color("marshal_White"))
                    .padding(.vertical, 8)
            }//:GROUP
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            Group{
                Text("ارز")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    .foregroundColor(Color("marshal_White"))
                    .padding(.vertical, 8)
            }//:GROUP
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
        }
        .background(Color("marshal_darkGrey"))
    }
}
//MARK: -PREVIEW
struct ExchangeTopBar_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeTopBar()
    }
}
