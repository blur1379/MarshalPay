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
    //MARK: - BODY
    var body: some View {
        //HStack{
            ZStack(alignment: isEn ? .leading : .trailing){
                // TEXT
                if showText {
                    Text(title)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                        .foregroundColor(Color("marshal_White"))
                        .padding(.trailing, 16.0)
                }
                //TEXTFIELD
                TextField("", text: $text)
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 18.0))
                    .padding(.horizontal, 16.0)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color("marshal_White"))
                    .onChange(of: text) { newValue in
                        if text.isEmpty {
                            showText = true
                        }else{
                            showText = false
                        }
                        
                    }//: ONCHANGE
                    .disableAutocorrection(true)
            }//:ZSTACK
            //.padding(.horizontal)
            
            .frame(height: 56, alignment: .center)
            .background(Color("marshal_surfGrey"))
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.white, lineWidth: 0.5)
            
            )
        //}//: HSTACK
        
        //.background(Color("marshal_darkGrey"))

    }
}
//MARK: - PREVIEW
struct MarshalTextField_Previews: PreviewProvider {
    static var previews: some View {
        MarshalTextField(text: .constant(""), title: "عنوان")
    }
}
