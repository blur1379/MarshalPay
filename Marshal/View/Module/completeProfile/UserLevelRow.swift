//
//  UserLevelRow.swift
//  Marshal
//
//  Created by Moeen Kashisaz on 1/16/22.
//

import SwiftUI

struct UserLevelRow: View {
    var body: some View {
        HStack(alignment: .center, spacing: 16.0) {
            
            Spacer()
            
            Text("طلایی")
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
        .background(Color("marshal_surfGrey"))
        .cornerRadius(12.0)
        .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("marshal_red"), lineWidth:0.5))
        .shadow(color: .black, radius: 5, x: 8, y: 8)
        
    }
}

struct UserLevelRow_Previews: PreviewProvider {
    static var previews: some View {
        UserLevelRow()
    }
}
