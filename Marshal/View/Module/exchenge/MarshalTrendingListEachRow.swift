//
//  MarshalTrendingEachRow.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/8/1400 AP.
//

import SwiftUI

struct MarshalTrendingListEachRow: View {
    var body: some View {
        HStack (spacing: 8){
            
            Text("- ۰۰,۰۰ %")
                .foregroundColor(Color("marshal_White"))
                .font(Font.custom("IRANSansMobileFaNum Bold", size: 16))
                .padding(.horizontal, 16.0)
                .cornerRadius(12.0)
                //.frame(minWidth: 0.0, maxWidth: .infinity, minHeight: 0.0, maxHeight: 56.0)
                .frame(height: 32.0)
                .background(Color("marshal_red"))
                .cornerRadius(6.0)
                

            Text("۰۰۰,۰۰۰")
                .foregroundColor(Color("marshal_White"))
                .font(Font.custom("IRANSansMobileFaNum Bold", size: 24))
                .padding(8.0)
            
            Spacer()
            
            HStack (spacing: 4){
                Text("مارشال")
                    .foregroundColor(Color("marshal_White"))
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 16))
                
                Text(":")
                    .foregroundColor(Color("marshal_White"))
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 16))
                
                Text("نام ارز")
                    .foregroundColor(Color("marshal_White"))
                    .font(Font.custom("IRANSansMobileFaNum Bold", size: 16))
            }
  
        }
        .padding(.horizontal, 12.0)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 56)
        .background(Color("marshal_surfGrey"))
        .cornerRadius(12)
        .overlay(
        RoundedRectangle(cornerRadius: 12)
            .stroke(Color("marshal_red"), lineWidth: 0.5)
        )
        
    }
}

struct MarshalTrendingListEachRow_Previews: PreviewProvider {
    static var previews: some View {
        MarshalTrendingListEachRow()
            .previewLayout(.sizeThatFits)
    }
}
