//
//  MarshalCompleteProfileStepBar.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/11/1400 AP.
//

import SwiftUI

struct MarshalCompleteProfileStepBar: View {
    @State var userLevel : UserLevelModel
    @EnvironmentObject var currentUserLevel : UserLevelPages
    
    
    var body: some View {
        HStack(alignment: .center, spacing: 0.0) {
            Group{
                if userLevel.registerLevels.imagesLevel {
                    Spacer()
                    Image(currentUserLevel.imagesLevel ? "upload_Image_selected_ic": "upload_image_ic" )
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40, alignment: .center)
                        .shadow(color: .black, radius: 4, y: currentUserLevel.imagesLevel  ? 0 : 4)
    //                    .padding(.leading , 2)
                }
                if userLevel.registerLevels.persianLevel {
                    Spacer()
                        Image(currentUserLevel.persianLevel  ? "pertian_information_selected_ic": "pertian_information_ic" )
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40, alignment: .center)
                            .shadow(color: .black, radius: 4, y: currentUserLevel.persianLevel ? 0 : 4)
                }
                if userLevel.registerLevels.englishLevel {
                    Spacer()
                    Image(currentUserLevel.englishLevel ? "english_information_selected_ic": "english_information_ic" )
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40, alignment: .center)
                        .shadow(color: .black, radius: 4, y: currentUserLevel.englishLevel  ? 0 : 4)
                }

            
            }
           
 
            if userLevel.registerLevels.jobLevel {
                Spacer()
                    
                    Image(currentUserLevel.jobLevel  ? "work_information_selected_ic": "work_information_ic" )
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40, alignment: .center)
                        .shadow(color: .black, radius: 4, y: currentUserLevel.jobLevel  ? 0 : 4)
            }
            if userLevel.registerLevels.educationLevel {
                Spacer()
                    Image(currentUserLevel.educationLevel ? "education_information_selected_ic": "education_information_ic" )
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40, alignment: .center)
                        .shadow(color: .black, radius: 4, y: currentUserLevel.educationLevel  ? 0 : 4)
            }

            Spacer()
    
        }
        .padding(16.0)
        //.padding(.bottom, 16.0)
        .frame(maxWidth: .infinity)
        
        //.background(Color("marshal_darkGrey"))
    }
}

struct MarshalCompleteProfileStepBar_Previews: PreviewProvider {
    static var previews: some View {
        MarshalCompleteProfileStepBar(userLevel: UserLevelModel())
            .previewLayout(.sizeThatFits)
    }
}
