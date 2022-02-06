//
//  MarshalTextField.swift
//  Marshal
//
//  Created by Blur on 12/24/21.
//

import SwiftUI

struct MarshalTextField: View {
    //MARK: - PROPERTIS
  
    @State var showText : Bool = true
    @Binding var text: String
    let title : String
    var isEn : Bool = false
    var keyboardType : UIKeyboardType = .default
    var limitedItem : Int?
    var heightOfBox : CGFloat = 56
    
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
                TextField("", text: $text)
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                    .keyboardType(keyboardType)
                    .padding(.horizontal, 16.0)
                    //.multilineTextAlignment(.leading)
                    .foregroundColor(Color("marshal_White"))
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
            .offset(y: -(heightOfBox * 3/7))
            .animation(.easeIn, value: showText)

            
        }//: ZSTACK
    
    }
}
//MARK: - PREVIEW
struct MarshalTextField_Previews: PreviewProvider {
    static var previews: some View {
        MarshalTextField(text: .constant(""), title: "عنوان").previewLayout(.sizeThatFits)
    }
}
