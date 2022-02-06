//
//  MarshalCompleteProfileStepBar.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/11/1400 AP.
//

import SwiftUI

struct MarshalCompleteProfileStepBar: View {
    
    @State var pages = UserLevelPages()
    
    var body: some View {
        HStack(alignment: .center, spacing: 0.0) {
            
                
                Image(pages.imagesLevel ? "upload_Image_selected_ic": "upload_image_ic" )
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .shadow(color: .black, radius: 4, y: pages.imagesLevel  ? 0 : 4)
//                    .padding(.leading , 2)
                
                Image(pages.englishLevel ? "english_information_selected_ic": "english_information_ic" )
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .shadow(color: .black, radius: 4, y: pages.englishLevel  ? 0 : 4)
                
                Image(pages.persianLevel  ? "pertian_information_selected_ic": "pertian_information_ic" )
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .shadow(color: .black, radius: 4, y: pages.persianLevel ? 0 : 4)
 
            

        
            
            
                
                Image(pages.jobLevel  ? "work_information_selected_ic": "work_information_ic" )
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .shadow(color: .black, radius: 4, y: pages.jobLevel  ? 0 : 4)
                Image(pages.educationLevel ? "education_information_selected_ic": "education_information_ic" )
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .shadow(color: .black, radius: 4, y: pages.educationLevel  ? 0 : 4)
            
    
        }
        .padding(16.0)
        //.padding(.bottom, 16.0)
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
