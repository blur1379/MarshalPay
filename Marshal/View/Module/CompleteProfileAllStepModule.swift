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
            
            UploadImageStep()
            
            PertianImformationStep()
            
            EnglishInformationStep()
            
            WorkInformationStep()
            
            EducationInformationStep()
            
            
            
            
            
            
        }
        .background(Color("marshal_darkGrey"))
        .frame(maxHeight: .infinity)
        .transition(AnyTransition.slide)
        .animation(.default)
        
    }
}

struct CompleteProfileAllStepModule_Previews: PreviewProvider {
    static var previews: some View {
        CompleteProfileAllStepModule()
            .previewLayout(.sizeThatFits)
        
    }
}
