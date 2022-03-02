//
//  UserCart.swift
//  Marshal
//
//  Created by Blur on 12/11/1400 AP.
//

import SwiftUI

struct UserCart: View {
    @State var userLevel = UserLevelModel()
    @State var userNumber = "6037697531233309"
    var body: some View {
        VStack{
            HStack{
                VStack{
                    HStack{
                        Text("کاربر مارشال پی")
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                            .padding(16.0)
                            .padding(.leading, 8)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color("marshal_White"))
                        
                        Spacer()
                        Image("marshal_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30, alignment: .center)
                            .padding( 16.0)
                       
                    }//:HSTACK
                    HStack{
                        Text("6037697531233309")
                            .font(Font.custom("FarBank", size: 24))
                            .padding(16.0)
                            .padding(.leading, 8)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(Color("marshal_White"))
                        
                    }//:HSTACK
                }//:VSTACK
              
         
            }//:HSTACK
            .frame(minWidth: 0 , maxWidth: .infinity)
            .background(Image(userLevel.getbackForUserCart()).resizable().scaledToFill())
            .cornerRadius(16)
            Spacer()
        }.background(Color("marshal_darkGrey"))
       
    }
}

struct UserCart_Previews: PreviewProvider {
    static var previews: some View {
        UserCart()
    }
}
