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
        
        ZStack {

            ZStack {

                HStack (spacing: 0){
                    //CONTRY FLAG
                    HStack{
                        Text(countryFlag)
                        //DIVIDER
                        //Rectangle()
                            //.background(Color.white)
                            //.foregroundColor(Color.white)
                            //.frame(width: 1 ,height: 50)
                        //NATIUNALCODE
                        Text("+\(countryCode)")
                            .foregroundColor(Color("marshal_White"))
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 14))
                        
                    }//: HSTACK
                    
                    .padding(.horizontal, 16.0)
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
                                .foregroundColor(Color("marshal_White"))
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                                .padding(.horizontal, 16.0)
                        }
                        //TEXTFIELD
                        TextField("", text: $phoneNumber)
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 18.0))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("marshal_White"))
                            //.padding(.horizontal, 16.0)
                            .onChange(of: phoneNumber) { newValue in
                                if phoneNumber.isEmpty {
                                    showText = true
                                }else{
                                    showText = false
                                }
                                
                            }//: ONCHANGE
                            .disableAutocorrection(true)
                    }//:ZSTACK
                    
                }

            }
            .frame(height: 56)
            .background(Color("marshal_surfGrey"))
            .cornerRadius(12)
            .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color("marshal_White"), lineWidth: 0.5)
            )
            .animation(.easeOut, value: showText)

            HStack {
                
                Spacer()
                
                if !showText{
                    //: TEXT TITLE
                    Text("تلفن همراه")
                        .padding(.horizontal, 16.0)
                        .padding(.vertical, 4.0)
                        .foregroundColor(Color("marshal_White"))
                        .font(Font.custom("IRANSansMobileFaNum Light", size: 10))
                        .background(Color("marshal_surfGrey"))
                        .cornerRadius(8.0)
                        .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color("marshal_White"), lineWidth:0.5)
                        )
                    
                        
                }
                
            }
            .padding(.horizontal, 16.0)
            .offset(y: -28)
            .animation(.easeIn, value: showText)
            
        }
        
        
    }
    //MARK: - FUNCTION
}

struct MarshalPhoneNumber_Previews: PreviewProvider {
    static var previews: some View {
        MarshalPhoneNumber()
            .previewLayout(.sizeThatFits)
    }
}
