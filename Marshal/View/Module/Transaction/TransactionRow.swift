//
//  TransactionRow.swift
//  Marshal
//
//  Created by mohammad blor on 3/14/22.
//

import SwiftUI

struct TransactionRow: View {
    var transaction : Transaction
    var body: some View {
        HStack{
            
            
            
            Text(transaction.status)
                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                .multilineTextAlignment(.trailing)
                .padding(8)
                .foregroundColor(Color(transaction.colorOfBorder))
                
                .frame(minWidth: 0, maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(12)
                .overlay(RoundedRectangle(cornerRadius: 12)
                            .stroke(Color(transaction.colorOfBorder), lineWidth: 2)
//                            .stroke(Color.blue, lineWidth: 2)
                          
                )
            
            
            Text(transaction.date)
                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                .multilineTextAlignment(.trailing)
                .padding()
                .foregroundColor(Color.white)
                .frame(minWidth: 0, maxWidth: .infinity)

            
    
            Text(transaction.amount)
                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                .multilineTextAlignment(.trailing)
                .padding()
                .foregroundColor(Color.white)
                .frame(minWidth: 0, maxWidth: .infinity)
            

        }
       
        .cornerRadius(16)
        padding(.horizontal , 8)
        
        .background(Color("marshal_darkGrey"))
        
    }
    
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(transaction: Transaction())
    }
}
