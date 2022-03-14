//
//  ProfileModule.swift
//  Marshal
//
//  Created by Blur on 2/9/22.
//

import SwiftUI
import Foundation
import SwiftyJSON
import Alamofire

struct ProfileModule: View {
    //MARK: -PROPERTIES
    @AppStorage("showLogin") var showLogin = false
    @AppStorage("showTabBar") var showTabBar : Bool = true
    @AppStorage("acc") var acceceToken = ""
    @StateObject var pages = UserLevelPages()
    @State var user = User()
    @State var status = Status.none
    
    
    var harvestRow : some View {
        HStack{

            Spacer()
            
            Text("لیست برداشت ها")
                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                .padding(.horizontal, 16.0)
                .padding()
                .multilineTextAlignment(.trailing)
                .foregroundColor(Color("marshal_White"))
            
            Spacer()
            
        } .frame(height: 50, alignment: .center)
            .background(Color("marshal_surfGrey"))
            .cornerRadius(12)
            .overlay(RoundedRectangle(cornerRadius: 12)
                        .stroke(Color("marshal_red"), lineWidth: 0.5)
                     
            )
            .padding(.horizontal , 16)
            .padding(.vertical , 8)
            
        
        
    }
    
    var depositRow : some View {
    HStack{
        
        Spacer()
        
        Text("لیست واریز ها")
            .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
            .padding(.horizontal, 16.0)
            .padding()
            .multilineTextAlignment(.trailing)
            .foregroundColor(Color("marshal_White"))
        
        Spacer()
        
    } .frame(height: 50, alignment: .center)
        .background(Color("marshal_surfGrey"))
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("marshal_red"), lineWidth: 0.5)
                    
        )
        .padding(.horizontal , 16)
        .padding(.vertical , 8)
    
    
}
    
    var userInformation : some View {
        
    
        
    HStack{

        Spacer()
        
        Text("مشخصات کاربری")
            .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
            .padding(.horizontal, 16.0)
            .padding()
            .multilineTextAlignment(.trailing)
            .foregroundColor(Color("marshal_White"))
        
        Spacer()
        
    } .frame(height: 50, alignment: .center)
        .background(Color("marshal_surfGrey"))
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("marshal_red"), lineWidth: 0.5)
                    
        )
        .padding(.horizontal , 16)
        .padding(.vertical , 8)
    
    
}
    
    var exit : some View {
    HStack{
        Spacer()
        Text("خروج از حساب ")
            .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
            .padding(.horizontal, 16.0)
            .padding()
            .multilineTextAlignment(.trailing)
            .foregroundColor(Color("marshal_White"))
        Spacer()
        
    } .frame(height: 50, alignment: .center)
        .background(Color("marshal_surfGrey"))
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("marshal_red"), lineWidth: 0.5)
                    
        )
        .padding(.horizontal , 16)
        .padding(.vertical , 8)
        .onTapGesture {
            
            acceceToken = ""
            showLogin = true
        }
    
}
    
    
    //MARK: -BODY
    var body: some View {
       
            ZStack(alignment: .center){
                if status == .Successful {
                    ScrollView {
                        VStack(spacing : 0){
                            HStack{
                                UserCart(user: user)
                                    .shadow(color: Color.black, radius: 15, y: -12)
                                    .padding(.top,44)
                                    .padding(.horizontal, 24)
                            }
                            .background(Image("backforprofile").resizable())
                            
                            harvestRow
                            
                            depositRow
                            
                            userInformation
                            
                            exit
                            Spacer()
                        }
                    }
                }else if status == .InProgress{
                    
                    ProgressViewMarshal()
                    
                }else if status == .Failure {
                    FailedMarshal {
                        getUser()
                    }
                }
                Spacer()
            }.onAppear{
                getUser()
            }
            .background(Color("marshal_darkGrey"))
    }
    
    //MARK: -FUNCTION
    
    //MARK: -CALL API
    func getUser(){
        status = .InProgress
        let url = "v1/users/get-profile"
        let headers: HTTPHeaders?
        
        headers = [
            "Authorization": "Bearer \(CallApi().acceceToken)"
        ]
        AF.request(CallApi().baceUrl + url, method: .get, encoding: JSONEncoding.default,headers: headers){urlRequest in urlRequest.timeoutInterval = TimeInterval(CallApi().timeOut)}.responseJSON { response in
            do {
                switch response.result {
                case .success :
                    let json = try JSON(data: response.data!)
                    print("------ send code")
                    print(json)
                    print("------- send code")
                    if response.response?.statusCode == 200 || response.response?.statusCode == 201  {
                         user = ConvertJsonToObject().convertJsonToUser(json["data"])
                        status = .Successful
                    }else if response.response?.statusCode == 401 {
                        showLogin = true
                        status = .Failure
                    }else{
                        status = .Failure
                    }
                    print( "v1/users/validation-activation-code")
                    print(response.response?.statusCode ?? 0)

                    break
                case let .failure(error):
                    print( "v1/users/validation-activation-code")
                    status = .Failure
                    if response.response != nil {
                        print(response.response?.statusCode ?? 0 )
                    }
                    print("failed")
                    print(error)
                    break
                }
            }catch{
                print("v1/users/validation-activation-code")
                status = .Failure
                if response.response != nil {
                    print(response.response?.statusCode ?? 0)
                }
                print("nil response")
            }
            
        }
    }
    
}
//MARK: -PREVIEW
struct ProfileModule_Previews: PreviewProvider {
    static var previews: some View {
        ProfileModule()
    }
}
