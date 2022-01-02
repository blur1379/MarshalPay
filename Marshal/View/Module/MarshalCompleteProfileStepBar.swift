//
//  MarshalCompleteProfileStepBar.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/11/1400 AP.
//

import SwiftUI

struct MarshalCompleteProfileStepBar: View {
    var body: some View {
        HStack(alignment: .center, spacing: 0.0) {
            
            Group {
                
                Text("۱")
                    .font(Font.custom("IRANSansMobileFaNum Bold", size: 20.0))
                    .foregroundColor(Color("marshal_White"))
                    .frame(width: 40.0, height: 40.0, alignment: .center)
                    //.background(Color("marshal_darkGrey"))
                    .clipShape(Circle())
                    .overlay(Circle().strokeBorder(Color("marshal_White"), lineWidth: 4.0))
                
                Divider()
                    .frame(height: 4.0)
                    .frame(maxWidth: .infinity)
                    .background(Color("marshal_White"))
                
                Text("۲")
                    .font(Font.custom("IRANSansMobileFaNum Bold", size: 20.0))
                    .foregroundColor(Color("marshal_White"))
                    .frame(width: 40.0, height: 40.0, alignment: .center)
                    //.background(Color("marshal_darkGrey"))
                    .clipShape(Circle())
                    .overlay(Circle().strokeBorder(Color("marshal_White"), lineWidth: 4.0))
                
                Divider()
                    .frame(height: 4.0)
                    .frame(maxWidth: .infinity)
                    .background(Color("marshal_White"))
                
                Text("۳")
                    .font(Font.custom("IRANSansMobileFaNum Bold", size: 20.0))
                    .foregroundColor(Color("marshal_White"))
                    .frame(width: 40.0, height: 40.0, alignment: .center)
                    //.background(Color("marshal_darkGrey"))
                    .clipShape(Circle())
                    .overlay(Circle().strokeBorder(Color("marshal_White"), lineWidth: 4.0))
 
            }
            
            Divider()
                .frame(height: 4.0)
                .frame(maxWidth: .infinity)
                .background(Color("marshal_White"))
        
            
            Group {
                
                Text("۴")
                    .font(Font.custom("IRANSansMobileFaNum Bold", size: 20.0))
                    .foregroundColor(Color("marshal_White"))
                    .frame(width: 40.0, height: 40.0, alignment: .center)
                    //.background(Color("marshal_darkGrey"))
                    .clipShape(Circle())
                    .overlay(Circle().strokeBorder(Color("marshal_White"), lineWidth: 4.0))
                
                Divider()
                    .frame(height: 4.0)
                    .frame(maxWidth: .infinity)
                    .background(Color("marshal_White"))
                
                Text("۵")
                    .font(Font.custom("IRANSansMobileFaNum Bold", size: 20.0))
                    .foregroundColor(Color("marshal_White"))
                    .frame(width: 40.0, height: 40.0, alignment: .center)
                    //.background(Color("marshal_darkGrey"))
                    .clipShape(Circle())
                    .overlay(Circle().strokeBorder(Color("marshal_White"), lineWidth: 4.0))
                
                Divider()
                    .frame(height: 4.0)
                    .frame(maxWidth: .infinity)
                    .background(Color("marshal_White"))
                
                Text("۶")
                    .font(Font.custom("IRANSansMobileFaNum Bold", size: 20.0))
                    .foregroundColor(Color("marshal_White"))
                    .frame(width: 40.0, height: 40.0, alignment: .center)
                    //.background(Color("marshal_darkGrey"))
                    .clipShape(Circle())
                    .overlay(Circle().strokeBorder(Color("marshal_White"), lineWidth: 4.0))
 
            }
            
            
            
            
                
        }
        .frame(maxWidth: .infinity)
        //.background(Color("marshal_darkGrey"))
    }
}

struct MarshalCompleteProfileStepBar_Previews: PreviewProvider {
    static var previews: some View {
        MarshalCompleteProfileStepBar()
            .previewLayout(.sizeThatFits)
    }
}
