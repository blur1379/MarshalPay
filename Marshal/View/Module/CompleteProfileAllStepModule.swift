//
//  CompleteProfile.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/13/1400 AP.
//

import SwiftUI

struct CompleteProfileAllStepModule: View {
    
    @State var stepNomber = 6
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {

                MarshalCompleteProfileStepBar()

            ScrollView {
                
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
