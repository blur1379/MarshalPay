//
//  MarshalTabBar.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/7/1400 AP.
//

import SwiftUI

struct MarshalTabBar: View {
    var body: some View {
        
        HStack(alignment: .center, spacing: 0) {
            
            //Spacer()
            
            Button(action: {
                //write code 😎
            }) {
                
                VStack (alignment: .center, spacing: 8){
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32, alignment: .center)
                        .foregroundColor(Color("marshal_White"))
                    Text("صفحه کاربری")
                        .foregroundColor(Color("marshal_White"))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
            }
            
        //Spacer()
            
            Button(action: {
                //write code 😎
            }) {
                
                VStack (alignment: .center, spacing: 8){
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32, alignment: .center)
                        .foregroundColor(Color("marshal_White"))
                    Text("کیف پول")
                        .foregroundColor(Color("marshal_White"))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
            }
            
            //Spacer()
            
            Button(action: {
                //write code 😎
            }) {
                
                VStack (alignment: .center, spacing: 8){
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32, alignment: .center)
                        .foregroundColor(Color("marshal_White"))
                    Text("تاریخچه")
                        .foregroundColor(Color("marshal_White"))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
            }
            
            //Spacer()
            
            Button(action: {
                //write code 😎
            }) {
                
                VStack (alignment: .center, spacing: 8){
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .frame(width: 32, height: 32, alignment: .center)
                        .foregroundColor(Color("marshal_White"))
                    Text("صرافی")
                        .foregroundColor(Color("marshal_White"))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                
            }
            
            //Spacer()
            
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 88, alignment: .center)
        .background(Color("marshal_surfGrey"))
        
        

        
    }
}

struct MarshalTabBar_Previews: PreviewProvider {
    static var previews: some View {
        MarshalTabBar()
            .previewLayout(.sizeThatFits)
    }
}
