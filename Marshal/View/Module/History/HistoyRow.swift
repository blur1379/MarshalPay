//
//  HistoyRow.swift
//  Marshal
//
//  Created by mohammad blor on 3/12/22.
//

import SwiftUI

struct HistoyRow: View {
    var history : HistoryModel
    var body: some View {
        VStack{
            HStack{
                // marshal payment
                HStack{
                    
                }
                
                
                // currency payment
                HStack{
                    
                }
                
            } // :HSTACK
            
            HStack{
                //date of insert
            }
            
        }// :VSTACK
    }
}

struct HistoyRow_Previews: PreviewProvider {
    static var previews: some View {
        HistoyRow(history: HistoryModel())
    }
}
