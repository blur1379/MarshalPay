//
//  Submit.swift
//  Marshal
//
//  Created by Blur on 12/24/21.
//

import SwiftUI
struct Submit: View {
    var title : String
    var onClick : () -> Void
    var body: some View {
        Button(action: onClick) {
            Text(title)
                .padding(.horizontal ,56)
                .frame(height: 40)
                .foregroundColor(Color("marshal_White"))
                .font(Font.custom("IRANSansMobileFaNum Bold", size: 18))
                .background(Color("marshal_red"))
                .cornerRadius(12)
               
        }
    }
}

struct Submit_Previews: PreviewProvider {
    static var previews: some View {
        Submit(title: "تایید", onClick: {})
            .previewLayout(.sizeThatFits)
    }
}
