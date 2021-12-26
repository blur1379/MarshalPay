//
//  MarshalPhoneNumber.swift
//  Marshal
//
//  Created by Blur on 12/24/21.
//

import SwiftUI

struct MarshalPhoneNumber: View {
    @State var phoneNumber : String = ""
    @State var countryCode : String = "98"
    @State var countryFlag : String = "🇮🇷"
    @State private var isOppenSheet = false
    @State var showText = true
    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack{
                //CONTRY FLAG
                HStack{
                    Text(countryFlag)
                    //DIVIDER
                    Rectangle()
                        .background(Color.white)
                        .foregroundColor(Color.white)
                        .frame(width: 1 ,height: 50)
                    //NATIUNALCODE
                    Text("+\(countryCode)")
                        .foregroundColor(Color.white)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 12))
                    
                }//: HSTACK
                .padding(.horizontal)
                .onTapGesture {
                    isOppenSheet = true
                }
                .sheet(isPresented: $isOppenSheet) {
                    CountryList(flag: $countryFlag, code: $countryCode)
                }
                ZStack(alignment: .trailing){
                    // TEXT
                    if showText {
                        Text("شماره موبایل خود را وارد کنید ")
                            .foregroundColor(Color("marshal_hint"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 12))
                    }
                    //TEXTFIELD
                    TextField("", text: $phoneNumber)
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color.white)
                        .onChange(of: phoneNumber) { newValue in
                            if phoneNumber.isEmpty {
                                showText = true
                            }else{
                                showText = false
                            }
                            
                        }//: ONCHANGE
                        .disableAutocorrection(true)
                }//:ZSTACK
                .padding(.horizontal)
            }
            .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.white, lineWidth: 1)
            )
            .background(Color("marshal_bg"))
            if !showText{
                //: TEXT TITLE
                Text("تلفن همراه")
                    .foregroundColor(.white)
                    .font(Font.custom("IRANSansMobileFaNum Mediun", size: 10))
                    .background(Color("marshal_bg"))
                    .offset(x: -16, y: -5)
            }

        }.animation(.easeOut, value: showText)
    }
    //MARK: - FUNCTION
}

struct MarshalPhoneNumber_Previews: PreviewProvider {
    static var previews: some View {
        MarshalPhoneNumber()
            .previewLayout(.sizeThatFits)
    }
}
