//
//  CompleteProfile.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/13/1400 AP.
//

import SwiftUI

struct CompleteProfileAllStepModule: View {
    
    @State var stepNomber = 1
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {

                MarshalCompleteProfileStepBar()

            ScrollView {
                
                switch stepNomber{
                case 1:
                    UploadImageStep()
                case 2:
                    UserLevelModule()
                case 3:
                    PertianImformationStep()
                case 4:
                    EnglishInformationStep()
                case 5:
                    WorkInformationStep()
                case 6:
                    EducationInformationStep()
                    
                default:
                    Text("")
                }
            }

            //Spacer()
 
        }
        .background(Color("marshal_darkGrey"))
        .frame(maxHeight: .infinity)
        
        
    }
}

struct CompleteProfileAllStepModule_Previews: PreviewProvider {
    static var previews: some View {
        CompleteProfileAllStepModule()
            .previewLayout(.sizeThatFits)
            
    }
}
