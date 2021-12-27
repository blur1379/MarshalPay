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
        HStack{
            ZStack(alignment: isEn ? .leading : .trailing){
                // TEXT
                if showText {
                    Text(title)
                        .foregroundColor(Color("marshal_hint"))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 12))
                }
                //TEXTFIELD
                TextField("", text: $text)
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Color.white)
                    .onChange(of: text) { newValue in
                        if text.isEmpty {
                            showText = true
                        }else{
                            showText = false
                        }
                        
                    }//: ONCHANGE
                    .disableAutocorrection(true)
            }//:ZSTACK
            .padding(.horizontal)
        }//: HSTACK
        .frame(height: 50, alignment: .center)
        .overlay(
        RoundedRectangle(cornerRadius: 12)
            .stroke(Color.white, lineWidth: 1)
        )
        .background(Color("marshal_bg"))

    }
}
//MARK: - PREVIEW
struct MarshalTextField_Previews: PreviewProvider {
    static var previews: some View {
        MarshalTextField(text: .constant(""), title: "عنوان").previewLayout(.sizeThatFits)
    }
}
