//
//  CompleteProfile.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/13/1400 AP.
//

import SwiftUI

struct CompleteProfileAllStepModule: View {
    @State var userLevel : UserLevelModel
    @StateObject var currentUserLevel = UserLevelPages()
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            
            MarshalCompleteProfileStepBar(userLevel: userLevel)
            
            ScrollView{
                
                if currentUserLevel.imagesLevel{
                    UploadImageStep(pageSet: {
                        
                        if userLevel.registerLevels.persianLevel {
                            currentUserLevel.persianLevel = true
                        }else if userLevel.registerLevels.englishLevel {
                            currentUserLevel.englishLevel = true
                        }else if userLevel.registerLevels.jobLevel {
                            currentUserLevel.jobLevel = true
                        }else if userLevel.registerLevels.educationLevel {
                            currentUserLevel.educationLevel = true
                        }
                    })
                        .padding()
                }
                if currentUserLevel.persianLevel{
                    PertianImformationStep(pageSet: {
                        if userLevel.registerLevels.englishLevel {
                            currentUserLevel.englishLevel = true
                        }else if userLevel.registerLevels.jobLevel {
                            currentUserLevel.jobLevel = true
                        }else if userLevel.registerLevels.educationLevel {
                            currentUserLevel.educationLevel = true
                        }
                    })
                }
                if currentUserLevel.englishLevel{
                    EnglishInformationStep(pageSet: {
                        if userLevel.registerLevels.jobLevel {
                            currentUserLevel.jobLevel = true
                        }else if userLevel.registerLevels.educationLevel {
                            currentUserLevel.educationLevel = true
                        }
                    })
                }
                if currentUserLevel.jobLevel{
                    WorkInformationStep(pageSet: {
                        if userLevel.registerLevels.educationLevel {
                            currentUserLevel.educationLevel = true
                        }
                    })
                }
                if currentUserLevel.educationLevel{
                    EducationInformationStep(pageSet: {
                        
                    })
                }
            }
        }
        .navigationBarHidden(true)
        .background(Color("marshal_darkGrey"))
        .frame(maxHeight: .infinity)
        .transition(AnyTransition.slide)
        .animation(.default)
        .environmentObject(currentUserLevel)
        .onAppear {
           stepSet()
        }
    }
    func stepSet(){
        if userLevel.registerLevels.imagesLevel {
            currentUserLevel.imagesLevel = true
        }else if userLevel.registerLevels.persianLevel {
            currentUserLevel.persianLevel = true
        }else if userLevel.registerLevels.englishLevel {
            currentUserLevel.englishLevel = true
        }else if userLevel.registerLevels.jobLevel {
            currentUserLevel.jobLevel = true
        }else if userLevel.registerLevels.educationLevel {
            currentUserLevel.educationLevel = true
        }
    }
    func stepReset(){
        if userLevel.registerLevels.imagesLevel {
            currentUserLevel.imagesLevel = true
        }else if userLevel.registerLevels.persianLevel {
            currentUserLevel.persianLevel = true
        }else if userLevel.registerLevels.englishLevel {
            currentUserLevel.englishLevel = true
        }else if userLevel.registerLevels.jobLevel {
            currentUserLevel.jobLevel = true
        }else if userLevel.registerLevels.educationLevel {
            currentUserLevel.educationLevel = true
        }
    }
}

struct CompleteProfileAllStepModule_Previews: PreviewProvider {
    static var previews: some View {
        CompleteProfileAllStepModule(userLevel: UserLevelModel())
            .previewLayout(.sizeThatFits)
        
    }
}
