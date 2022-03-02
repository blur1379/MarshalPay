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
            
            ZStack{
                if status == .InProgress {
                    ProgressViewMarshal()
                        .frame(height: 52, alignment: .center)
                        .zIndex(2)
                }
              
                Text(title)
                    .padding(.horizontal ,50)
                    .padding(.vertical , 8)
                    .foregroundColor(Color(status == .InProgress ? "marshal_red" : "marshal_White"))
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
