//
//  MarshalTextField.swift
//  Marshal
//
//  Created by Blur on 12/24/21.
//

import SwiftUI
import Combine
struct MarshalTextField: View {
    //MARK: - PROPERTIS
    @State var showText : Bool = true
    @Binding var text: String
    let title : String
    var isEn : Bool = false
    var keyboardType : UIKeyboardType = .default
    var limitedItem : Int?
    var heightOfBox : CGFloat = 56
    var numberType : Bool = false
    var hasPlasAndMinus = false
    
    //MARK: - BODY
    var body: some View {
        ZStack{
            ZStack(alignment: isEn ? .leading : .trailing){
                // TEXT
                if showText {
                    Text(title)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                        .foregroundColor(Color("marshal_White"))
                        .padding(.horizontal, 16.0)
                }
                //TEXTFIELD
                HStack(spacing: 0 ){
                    if hasPlasAndMinus{
                        VStack{
                            Spacer()
                            Image(systemName: "plus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10, height: 10, alignment: .center)
                                .padding(.horizontal, 2)
                                .foregroundColor(Color("marshal_red"))
                            Spacer()
                            Rectangle()
                                .frame(width: 24,height: 1)
                            Spacer()
                            Image(systemName: "minus")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 10, height: 10, alignment: .center)
                                .padding(.horizontal , 2)
                                .foregroundColor(Color("marshal_red"))
                            Spacer()
                        }
                        Rectangle()
                            .frame(width: 1,height: heightOfBox)

                    }
                    if !isEn {
                        Spacer()
                    }
                    TextField("", text: $text)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                        .keyboardType(keyboardType)
                        .padding(.horizontal, 16.0)
                    //.multilineTextAlignment(.leading)
                        .foregroundColor(Color("marshal_White"))
                        .onReceive(Just(text)) { newValue in
                            if numberType{
                                let filtered = newValue.filter { "0123456789.۰۱۲۳۴۵۶۷۸۹".contains($0) }
                                if filtered != newValue {
                                    self.text = filtered
                                }
                            }
                            
                        }
                        .onChange(of: text) { newValue in
                            if text.isEmpty {
                                showText = true
                            }else{
                                showText = false
                                if limitedItem != 0 {
                                    if limitedItem != nil {
                                        if text.count > limitedItem! {
                                            text.removeLast()
                                        }
                                    }
                                }
                            }
                            
                        }//: ONCHANGE
                }
             
            }//:ZSTACK
            
            .frame(height: heightOfBox, alignment: .center)
            .background(Color("marshal_surfGrey"))
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white, lineWidth: 0.5)
                     
            )
            .animation(.easeOut, value: showText)
            
            HStack {
                
                Spacer()
                
                if !showText{
                    //: TEXT TITLE
                    Text(title)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4.0)
                        .foregroundColor(Color("marshal_White"))
                        .font(Font.custom("IRANSansMobileFaNum Light", size: 10))
                        .background(Color("marshal_surfGrey"))
                        .cornerRadius(8.0)
                        
                }
            }
            .padding(.horizontal, 16.0)
            .offset(y: -(heightOfBox * 4/7))
            .animation(.easeIn, value: showText)
            
            
        }//: ZSTACK
        .onAppear {
            if text.isEmpty {
                showText = true
            }else{
                showText = false
            }
        }
        
    }
}
//MARK: - PREVIEW
struct MarshalTextField_Previews: PreviewProvider {
    static var previews: some View {
        MarshalTextField(text: .constant(""), title: "عنوان").previewLayout(.sizeThatFits)
    }
}
