//
//  HistoyRow.swift
//  Marshal
//
//  Created by mohammad blor on 3/12/22.
//

import SwiftUI

struct HistoyRow: View {
    var history : HistoryModel
    var body: some View {
        VStack{
            HStack(spacing:0){
                // marshal payment
                HStack{
                    Text("مارشال")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                        .frame(minWidth: 0, maxWidth: .infinity)
                    Divider()
                 
                        .frame(width: 1, height: 22, alignment: .center)
                        .background(Color.white)
                    Text(history.marshalAmount)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(8)
               
                .overlay(RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.white, lineWidth: 0.5)
                            
                )
                .padding(.leading, 8)
                
                // arrow
                
                Image("arrow")
                    .frame(width: 50, height: 12, alignment: .center)
                    .rotationEffect(Angle.degrees(history.toMarshal ? 0 : 180))
                
                // currency payment
                HStack{
                    Text(history.currencyName)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                        .frame(minWidth: 0, maxWidth: .infinity)
                    Divider()
                 
                        .frame(width: 1, height: 22, alignment: .center)
                        .background(Color.white)
                    Text(history.currencyAmount)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                        .frame(minWidth: 0, maxWidth: .infinity)
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(8)
               
                .overlay(RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.white, lineWidth: 0.5)
                            
                )
                .padding(.trailing , 8)
                
                
                
            } // :HSTACK
            
            HStack(alignment: .center){
                //date of insert
                Text(history.pertianDate())
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color("marshal_red"))

                Text("تاریخ")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color("marshal_White"))
                
            }
            
        }// :VSTACK
        .padding(.vertical)
        .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white, lineWidth: 0.5)
                    
        )
        .padding(8)
        .background(Color("marshal_Grey"))
    }
}

struct HistoyRow_Previews: PreviewProvider {
    static var previews: some View {
        HistoyRow(history: HistoryModel())
    }
}
