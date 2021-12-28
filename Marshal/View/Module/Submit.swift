//
//  Submit.swift
//  Marshal
//
//  Created by Blur on 12/24/21.
//

import SwiftUI
struct Submit: View {
    @Binding var status : Status
    var title : String
    var onClick : () -> Void
    var body: some View {
        Button(action:{onClick()}
        ) {
            if status == .InProgress {
                ProgressViewMarshal()
                    .padding(.horizontal ,56)
                    .frame(width: 200, height: 40)
                    .foregroundColor(Color("marshal_White"))
                    .background(Color("marshal_red"))
                    .cornerRadius(12)
            }else{
                Text(title)
                    .padding(.horizontal ,56)
                    .frame(width: 200,height: 40)
                    .foregroundColor(Color("marshal_White"))
                    .font(Font.custom("IRANSansMobileFaNum Bold", size: 18))
                    .background(Color("marshal_red"))
                    .cornerRadius(12)
            }
        }.disabled(status == .InProgress)
    }
}

struct Submit_Previews: PreviewProvider {
    static var previews: some View {
        Submit(status: .constant(.none), title: "تایید", onClick: {})
            .previewLayout(.sizeThatFits)
    }
}
