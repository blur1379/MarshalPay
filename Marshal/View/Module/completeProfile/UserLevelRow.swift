//
//  UserLevelRow.swift
//  Marshal
//
//  Created by Moeen Kashisaz on 1/16/22.
//

import SwiftUI

struct UserLevelRow: View {
    //MARK: -PROPERTIES
    @Binding var selectedId : String
    @State var userLevel : UserLevelModel
    //MARK: -BODY
    var body: some View {
        HStack(alignment: .center, spacing: 16.0) {
            
            Spacer()
            
            Text(userLevel.label)
                .font(Font.custom("IRANSansMobileFaNum Medium", size: 20.0))
                .foregroundColor(Color("marshal_White"))
                .multilineTextAlignment(.trailing)
            
            Image("icon_badge_24dp")
                .resizable()
                .frame(width: 32.0, height: 32.0, alignment: .center)
            

        }
        .padding(.horizontal, 16.0)
        .frame(maxWidth: .infinity)
        .frame(height: 56.0)
        .background( selectedId == userLevel._id ? Image("background_for_user_leve").resizable() : Image("bacck_for_user_ level_unselected").resizable())
        .cornerRadius(12.0)
        .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("marshal_red"), lineWidth:0.5))
        .shadow(color: .black, radius: 5, x: selectedId == userLevel._id ? 0 : 6, y: selectedId == userLevel._id ? 0 : 6)
        .onTapGesture {
            selectedId = userLevel._id
        }
    }
}
//MARK: -PREVIEW
struct UserLevelRow_Previews: PreviewProvider {
    static var previews: some View {
        UserLevelRow( selectedId: .constant(""), userLevel: UserLevelModel())
    }
}
