//
//  MarshalCompleteProfileStep2Module.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/12/1400 AP.
//

import SwiftUI

struct UserLevelModule: View {
    @State var statusOfPage : Status = .none
    @State var userLevels = [UserLevelModel]()
    @State var selectedUserLevelId = ""
    let callApi = CallApi()
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .center, spacing: 16.0) {
                    
                    Spacer().frame(height: 0.0)

                    Text("سطح کاربری خود را تعیین کنید")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 24.0))
                        .foregroundColor(Color("marshal_Grey"))
                        .multilineTextAlignment(.trailing)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(Color("marshal_White"))
                        .cornerRadius(12)
                    if statusOfPage == .Successful{
                        ForEach(userLevels){ item in
                            UserLevelRow(selectedId: $selectedUserLevelId , userLevel: item)
                        }

                        NavigationLink {
                            CompleteProfileAllStepModule(userLevel: userLevels.first(where: {$0._id == selectedUserLevelId}) ?? UserLevelModel())
                        } label: {
                            Text("مرحله بعد")
                                .padding(.horizontal ,50)
                                .padding(.vertical , 8)
                                .foregroundColor(Color("marshal_White"))
                                .font(Font.custom("IRANSansMobileFaNum Bold", size: 18))
                                .background(Color("marshal_red"))
                                .cornerRadius(12)
                            
                        }
                        .disabled(selectedUserLevelId == "")
                        
                    }else if statusOfPage == .InProgress{
                        ProgressViewMarshal()
                    }else if statusOfPage == .Failure {
                        FailedMarshal {
                            onCreate()
                        }
                    }

                    Spacer()
         
                }
                .navigationBarHidden(true)
                .padding(.horizontal, 16.0)
                .onAppear {
                    onCreate()
                }

            }.background(Color("marshal_Grey"))
        }
    }
    func onCreate(){
        callApi.getUserLevels { userLevels in
            self.userLevels = userLevels
        } status: { Status in
            self.statusOfPage = Status
        }

    }
}

struct UserLevelModule_Previews: PreviewProvider {
    static var previews: some View {
        UserLevelModule()
            .previewLayout(.sizeThatFits)
    }
}
