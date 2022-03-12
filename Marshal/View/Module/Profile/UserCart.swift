//
//  UserCart.swift
//  Marshal
//
//  Created by Blur on 12/11/1400 AP.
//

import SwiftUI

struct UserCart: View {
    @State var user = User()
    @State var statusOfPage : Status = .none
    @State var currentCredit : Double = Double()
    let callApi = CallApi()
    var body: some View {
        VStack{
            HStack{
                if (user.information.userLevel.getbackForTitle() != ""){
                    ZStack{
                    
                    Image(user.information.userLevel.getbackForTitle())
                        .resizable()
                        .scaledToFill()
                        .frame( width: 30)
                        
                        Text(user.information.userLevel.name.uppercased())
                            .rotationEffect(.degrees(-90))
                            .fixedSize(horizontal: true, vertical: false)
                            .foregroundColor(Color.white)
                        
                        
                    }.frame( width: 30)
                }
             
                VStack{
                    HStack{
                        Text(user.firstName.fa == "" ? "کاربر مارشال پی" : user.firstName.fa + " " + user.lastName.fa)
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                            .padding(16.0)
                            .padding(.leading, 8)
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(user.information.userLevel.name != "default" ? Color.black : Color.white)
                        
                        Spacer()
                        Image("marshal_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30, alignment: .center)
                            .padding( 16.0)
                       
                    }//:HSTACK
                    .padding(.bottom , 16)
                    HStack(spacing: 0){
                        Text(user.accountNumber1)
                            .font(Font.custom("FarBank", size: 22))
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                                            
                        Text(user.accountNumber2)
                            .font(Font.custom("FarBank", size: 22))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            
                        Text(user.accountNumber3)
                            .font(Font.custom("FarBank", size: 22))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                        
                        Text(user.accountNumber4)
                            .font(Font.custom("FarBank", size: 22))
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            
                        
                    }//:HSTACK
                    .foregroundColor(user.information.userLevel.name != "default" ? Color.black : Color.white)
                    HStack{
                        Spacer()
                        HStack{
                           
                            Text(String(currentCredit))
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                                .padding(.horizontal ,16.0)
                                .padding(.vertical , 12)
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(Color("marshal_red"))
                            Rectangle()
                                .frame(width: 2)
                                .frame(minHeight: 0, maxHeight: .infinity)
                                .foregroundColor(Color.white)
                                .padding(.vertical , 4)
                            Text("اعتبار مارشال")
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                                .padding(.horizontal ,16.0)
                                .padding(.vertical , 12)
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(Color("marshal_White"))
                         
                            
                        }//:HSTACK
                        .background(Color("marshal_darkGrey"))
                        .cornerRadius(radius: 12, corners: [.topLeft, .bottomLeft])
                    }//:HSTACK
                    .padding(.bottom)
                }//:VSTACK
              
         
            }//:HSTACK
            .frame(minWidth: 0 , maxWidth: .infinity)
            .background(Image(user.information.userLevel.getbackForUserCart()).resizable().scaledToFill())
            .cornerRadius(16)
            Spacer()
        }
       
    }
    
    //MARK: -FUNCTION
    
    func onCreate(){
        statusOfPage = .InProgress
        callApi.getWallet { wallet in
            currentCredit = wallet.currentCredit
        } status: { status in
            
            self.statusOfPage = status
        }

    }
    
}

struct UserCart_Previews: PreviewProvider {
    static var previews: some View {
        UserCart()
            
    }
}
