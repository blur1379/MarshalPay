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
        
        VStack {
            
            MarshalCompleteProfileStepBar()
            
            switch stepNomber{
            case 1:
                MarshalCompleteProfileStep1Module()
            case 2:
                MarshalCompleteProfileStep2Module()
            case 3:
                MarshalCompleteProfileStep3Module()
            case 4:
                MarshalCompleteProfileStep4Module()
            case 5:
                MarshalCompleteProfileStep5Module()
            case 6:
                MarshalCompleteProfileStep6Module()
                
            default:
                Text("")
            }
 
        }
        
    }
}

struct CompleteProfileAllStepModule_Previews: PreviewProvider {
    static var previews: some View {
        CompleteProfileAllStepModule()
            .previewLayout(.sizeThatFits)
    }
}
