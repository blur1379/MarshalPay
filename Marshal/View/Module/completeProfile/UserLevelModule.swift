//
//  MarshalCompleteProfileStep2Module.swift
//  Marshal
//
//  Created by kasra ebrahimi on 10/12/1400 AP.
//

import SwiftUI

struct UserLevelModule: View {
    @State var statusOfPage : Status = .none
    @State var statusOfSubmitBottom : Status = .none
    @State var userLevels = [UserLevelModel]()
    let callApi = CallApi()
    var body: some View {
        ScrollView{
            VStack(alignment: .center, spacing: 16.0) {
                
                Spacer().frame(height: 0.0)

                Text("سطح کاربری خود را تعیین کنید")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 24.0))
                    .foregroundColor(Color("marshal_White"))
                    .multilineTextAlignment(.trailing)
                    
                ForEach(userLevels){ item in
                    
                    UserLevelRow(userLevel: item)
//                        .onTapGesture {
////                            userLevels.map({$0.selected = false})
//
//                        }
                    
                }

                Submit(status: $statusOfSubmitBottom, title: "مرحله بعد") {
                    print("press")
                }
                
                Spacer().frame(height: 4.0)
     
            }
            .padding(.horizontal, 16.0)
            .onAppear {
                onCreate()
            }

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
