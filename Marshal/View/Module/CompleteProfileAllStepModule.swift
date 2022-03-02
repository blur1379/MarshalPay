//
//  CompleteProfile.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/13/1400 AP.
//

import SwiftUI

struct CompleteProfileAllStepModule: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var userLevel : UserLevelModel
    @StateObject var currentUserLevel = UserLevelPages()
    @StateObject var user = User()
    @State var status = Status.none
    var body: some View {
        if status == .none || status == .Successful {
            VStack(alignment: .center, spacing: 0) {
                
                MarshalCompleteProfileStepBar(userLevel: userLevel)
                
                ScrollView{
                    
                    if currentUserLevel.imagesLevel{
                        UploadImageStep(pageSet: {
                            currentUserLevel.clearData()
                            if userLevel.registerLevels.persianLevel {
                                currentUserLevel.persianLevel = true
                            }else if userLevel.registerLevels.englishLevel {
                                currentUserLevel.englishLevel = true
                            }else if userLevel.registerLevels.jobLevel {
                                currentUserLevel.jobLevel = true
                            }else if userLevel.registerLevels.educationLevel {
                                currentUserLevel.educationLevel = true
                            }else{
                                updateProfile()
                            }
                        })
                            .padding()
                    }
                    if currentUserLevel.persianLevel{
                        PertianImformationStep(user: user, pageSet: {
                            
                            currentUserLevel.clearData()
                            
                            if userLevel.registerLevels.englishLevel {
                                currentUserLevel.englishLevel = true
                            }else if userLevel.registerLevels.jobLevel {
                                currentUserLevel.jobLevel = true
                            }else if userLevel.registerLevels.educationLevel {
                                currentUserLevel.educationLevel = true
                            }else{
                                updateProfile()
                            }
                        })
                    }
                    if currentUserLevel.englishLevel{
                        EnglishInformationStep(user: user, pageSet: {
                            
                            currentUserLevel.clearData()
                            if userLevel.registerLevels.jobLevel {
                                currentUserLevel.jobLevel = true
                            }else if userLevel.registerLevels.educationLevel {
                                currentUserLevel.educationLevel = true
                            }else{
                                updateProfile()
                            }
                        })
                    }
                    if currentUserLevel.jobLevel{
                        WorkInformationStep(user: user, pageSet: {
                            currentUserLevel.clearData()
                            if userLevel.registerLevels.educationLevel {
                                currentUserLevel.educationLevel = true
                            }else{
                                updateProfile()
                            }
                        })
                    }
                    if currentUserLevel.educationLevel{
                        EducationInformationStep(user: user, pageSet: {
                            
                                updateProfile()
                            
                        })
                    }
                }
                .environmentObject(user)
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

        }else if status == .Failure {
            VStack{
                Spacer()
                FailedMarshal {
                    updateProfile()
                }
                Spacer()
            }
        }else if status == .InProgress {
            VStack{
                Spacer()
                ProgressViewMarshal()
                Spacer()
            }
        }
    }
    
    func updateProfile(){
        let callApi = CallApi()
        callApi.updateProfile(user: user) { status in
            self.status = status
            if status == .Successful{
                presentationMode.wrappedValue.dismiss()
            }
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
