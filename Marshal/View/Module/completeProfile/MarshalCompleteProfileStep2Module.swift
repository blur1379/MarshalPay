//
//  MarshalCompleteProfileStep2Module.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/12/1400 AP.
//

import SwiftUI

struct MarshalCompleteProfileStep2Module: View {
    
    @State var statusOfSubmitBottom : Status = .none
    @State var userLevels = [UserLevelModel]()
    var body: some View {
        VStack(alignment: .center, spacing: 16.0) {
            
            Spacer().frame(height: 0.0)

            Text("سطح کاربری خود را تعیین کنید")
                .font(Font.custom("IRANSansMobileFaNum Medium", size: 24.0))
                .foregroundColor(Color("marshal_White"))
                .multilineTextAlignment(.trailing)
                
            ForEach(userLevels){ item in
                
                UserLevelRow(userLevel: item)
                
            }

            Submit(status: $statusOfSubmitBottom, title: "مرحله بعد") {
                print("press")
            }
            
            Spacer().frame(height: 4.0)
 
        }
        .padding(.horizontal, 16.0)
        
    }
}

struct MarshalCompleteProfileStep2Module_Previews: PreviewProvider {
    static var previews: some View {
        MarshalCompleteProfileStep2Module()
            .previewLayout(.sizeThatFits)
    }
}
