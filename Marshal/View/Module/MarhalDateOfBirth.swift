//
//  MarhalDateOfBirth.swift
//  Marshal
//
//  Created by Blur on 11/26/1400 AP.
//

import SwiftUI

struct MarhalDateOfBirth: View {
    let isEn : Bool
    @Binding var dateOfBirth : String
    @State var isSheetOpen : Bool = false
    var body: some View {
        ZStack(alignment: isEn ? .leading : .trailing){
            //TEXTFIELD
            HStack(spacing: 0 ){
                Text(dateOfBirth == "" ? "yyyy/mm/dd" : dateOfBirth)
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                    .padding(.horizontal, 16.0)
                    .foregroundColor(Color("marshal_White"))
                Spacer()
            }.onTapGesture {
                isSheetOpen.toggle()
            }.sheet(isPresented: $isSheetOpen) {
                MarshalDatePicker(isEnglish: isEn, dateOfBirthEntered: $dateOfBirth)
            }
         
        }//:ZSTACK
        .frame(height: 56, alignment: .center)
        .background(Color("marshal_surfGrey"))
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.white, lineWidth: 0.5)
                 
        )

    }
}

struct MarhalDateOfBirth_Previews: PreviewProvider {
    static var previews: some View {
        MarhalDateOfBirth(isEn: false, dateOfBirth: .constant("1379/11/1"))
            .previewLayout(.fixed(width: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/))
            .preferredColorScheme(.dark)
    }
}
