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
                .padding(.horizontal ,50)
                .frame(height: 40)
                .foregroundColor(Color.white)
                .font(Font.custom("IRANSansMobileFaNum Medium", size: 20))
                .background(Color("marshal_red"))
                .cornerRadius(12)
               
        }
    }
}

struct Submit_Previews: PreviewProvider {
    static var previews: some View {
        Submit(title: "تایید", onClick: {})
    }
}
