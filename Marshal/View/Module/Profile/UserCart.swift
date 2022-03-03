//
//  UserCart.swift
//  Marshal
//
//  Created by Blur on 12/11/1400 AP.
//

import SwiftUI

struct UserCart: View {
    @State var user = User()
    var body: some View {
        VStack{
            HStack{
                VStack{
                    HStack{
                        Text(user.firstName.fa == "" ? "کاربر مارشال پی" : user.firstName.fa + user.lastName.fa)
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
                    .padding(.bottom , 16)
                    HStack(spacing: 0){
                        Text("6037")
                            .font(Font.custom("FarBank", size: 22))
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("marshal_White"))
                    
                        Text("6037")
                            .font(Font.custom("FarBank", size: 22))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color("marshal_White"))
                        Text("6037")
                            .font(Font.custom("FarBank", size: 22))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color("marshal_White"))
                        Text("6037")
                            .font(Font.custom("FarBank", size: 22))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(Color("marshal_White"))
                        
                    }//:HSTACK
                    
                    HStack{
                        Spacer()
                        HStack{
                           
                            Text("کاربر مارشال پی")
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                                .padding(.horizontal ,16.0)
                                .padding(.vertical , 12)
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(Color("marshal_White"))
                            Rectangle()
                                .frame(width: 1)
                                .frame(minHeight: 0, maxHeight: .infinity)
                                .background(Color.white)
                                .padding(.vertical , 4)
                            Text(String(user.information.userLevel.credit))
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                                .padding(.horizontal ,16.0)
                                .padding(.vertical , 12)
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(Color("marshal_White"))
                         
                            
                        }//:HSTACK
                        .background(Color("marshal_darkGrey"))
                        .cornerRadius(radius: 12, corners: [.topLeft, .bottomLeft])
                    }//:HSTACK
                    .padding(.vertical)
                    
                }//:VSTACK
              
         
            }//:HSTACK
            .frame(minWidth: 0 , maxWidth: .infinity)
            .background(Image(user.information.userLevel.getbackForUserCart()).resizable().scaledToFill())
            .cornerRadius(16)
            Spacer()
        }
       
    }
}

struct UserCart_Previews: PreviewProvider {
    static var previews: some View {
        UserCart()
    }
}
