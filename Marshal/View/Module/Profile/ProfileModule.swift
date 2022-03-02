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
    @StateObject var pages = UserLevelPages()
    @State var user = User()
    @State var status = Status.Successful
    
    var userCard : some View{
        HStack{
            
        }//:HSTACK
        
    }
    
    var harvestRow : some View {
        HStack{
            Image(systemName: "arrowtriangle.down.fill")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 8, height: 6)
                .padding(.horizontal, 16.0)
            
            Spacer()
            
            Text("لیست برداشت ها")
                .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                .padding(.horizontal, 16.0)
                .padding()
                .multilineTextAlignment(.trailing)
                .foregroundColor(Color("marshal_White"))
            
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
        Image(systemName: "arrowtriangle.down.fill")
            .resizable()
            .foregroundColor(.white)
            .frame(width: 8, height: 6)
            .padding(.horizontal, 16.0)
        
        Spacer()
        
        Text("لیست واریز ها")
            .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
            .padding(.horizontal, 16.0)
            .padding()
            .multilineTextAlignment(.trailing)
            .foregroundColor(Color("marshal_White"))
        
    } .frame(height: 50, alignment: .center)
        .background(Color("marshal_surfGrey"))
        .cornerRadius(12)
        .overlay(RoundedRectangle(cornerRadius: 12)
                    .stroke(Color("marshal_red"), lineWidth: 0.5)
                    
        )
        .padding(.horizontal , 16)
        .padding(.vertical , 8)
    
    
}
    
    var stepBar : some View {
        HStack(alignment: .center, spacing: 0.0) {
            Group{
                Spacer()
                Image(pages.imagesLevel ? "upload_Image_selected_ic": "upload_image_ic" )
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .shadow(color: .black, radius: 4, y: pages.imagesLevel  ? 0 : 4)
                    .onTapGesture {
                        pages.clearData()
                        pages.imagesLevel = true
                    }
                //                    .padding(.leading , 2)
                
                Spacer()
                
                Image(pages.englishLevel ? "english_information_selected_ic": "english_information_ic" )
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40, alignment: .center)
                    .shadow(color: .black, radius: 4, y: pages.englishLevel  ? 0 : 4)
                    .onTapGesture {
                        pages.clearData()
                        
                        pages.englishLevel = true
                    }
                
                Spacer()
            }
            
            Image(pages.persianLevel  ? "pertian_information_selected_ic": "pertian_information_ic" )
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
                .shadow(color: .black, radius: 4, y: pages.persianLevel ? 0 : 4)
                .onTapGesture {
                    pages.clearData()
                    pages.persianLevel = true
                }
            
            
            
            
            Spacer()
            
            Image(pages.jobLevel  ? "work_information_selected_ic": "work_information_ic" )
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
                .shadow(color: .black, radius: 4, y: pages.jobLevel  ? 0 : 4)
                .onTapGesture {
                    pages.clearData()
                    pages.jobLevel = true
                }
            Spacer()
            Image(pages.educationLevel ? "education_information_selected_ic": "education_information_ic" )
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40, alignment: .center)
                .shadow(color: .black, radius: 4, y: pages.educationLevel  ? 0 : 4)
                .onTapGesture {
                    pages.clearData()
                    pages.educationLevel = true
                }
            Spacer()
            
        }
        .padding(16.0)
        //.padding(.bottom, 16.0)
        .frame(maxWidth: .infinity)
        
        //.background(Color("marshal_darkGrey"))
    }
    
    var identificationCardImage : some View {
        VStack{
            if  user.information.identificationCardImage != "" {
                DownloadImage(imageName: $user.information.identificationCardImage)
            }else{
                Text("شما هنوز عکس مدارک خود را بارگذاری نکرده‌اید ")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 16))
                    .foregroundColor(Color("marshal_White"))
                    .padding(.horizontal, 16.0)
                    .padding(.bottom)
                    .padding()
                    .multilineTextAlignment(.trailing)
            }
        }.frame(minWidth: 0, maxWidth: .infinity)
        
        
    }
    
    var englishInformation : some View {
        HStack{
            VStack{
                HStack{
                    Text("Name")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                    Text(user.firstName.en)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                    
                }
                HStack{
                    Text("National Code")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                    
                    Text(user.information.nationalCode)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                }
                HStack{
                    Text("Date")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                    
                    Text(user.information.birthDate)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                }
                
                HStack{
                    Text("City")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                    
                    Text(user.information.city.en)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                }
                
                HStack{
                    Text("Street")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                    Text(user.information.street.en)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                }
            }.frame(minWidth: 0, maxWidth: .infinity)
            VStack{
                HStack{
                    Text("last name ")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                    Text(user.lastName.en)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                }
                
                HStack{
                    Text("Job")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                    Text(user.information.jab.en)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                }
                
                HStack{
                    Text("Postal code")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                    Text(String(user.information.residencePostalCode))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                }
                
                HStack{
                    Text("mobile Nember")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                    
                    Text(user.information.alternativeMobile)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                }
                
                HStack{
                    Text("State")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                    Text(user.information.state.en)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                }
                
                
            }.frame(minWidth: 0, maxWidth: .infinity)
        }//:HSTACK
    }
    
    var pertianInformation : some View {
        HStack{
            VStack{
                HStack{
                    Text(user.firstName.fa)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                    Text("نام")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))

                    
                }
                HStack{
                    Text(user.information.nationalCode)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                    
                    Text("کد ملی")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))

                  
                }
                HStack{
                    Text(user.information.birthDate)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                       
                    
                    Text("تاریخ تولد")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                }
                
                HStack{
                    Text(user.information.city.fa)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                        
                    
                    Text("شهر")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                }
                
                HStack{
                    Text(user.information.street.fa)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                    Text("خیابان")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                       
                }
            }.frame(minWidth: 0, maxWidth: .infinity)
            VStack{
                HStack{
                    Text(user.lastName.fa)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                    
                    Text("نام خانوادگی")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                }
                
                HStack{
                    Text(user.information.jab.fa)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                        
                    Text("شغل")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                }
                
                HStack{
                    Text(String(user.information.residencePostalCode))
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                      
                    Text("کد پستی")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                }
                
                HStack{
                    Text(user.information.alternativeMobile)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                       
                    
                    Text("شماره تلفن همراه")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                }
                
                HStack{
                    Text(user.information.state.fa)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_red"))
                    Text("استان")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 10))
                    
                        .padding(.bottom)
                        .padding()
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(Color("marshal_White"))
                }
                
                
            }.frame(minWidth: 0, maxWidth: .infinity)
        }//:HSTACK
    }
    
    var jabInformation : some View {
        VStack{
            if  user.information.identificationCardImage != "" {
                DownloadImage(imageName: $user.information.identificationCardImage)
            }else{
                Text("شما هنوز عکس مدارک خود را بارگذاری نکرده‌اید ")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 16))
                    .foregroundColor(Color("marshal_White"))
                    .padding(.horizontal, 16.0)
                    .padding(.bottom)
                    .padding()
                    .multilineTextAlignment(.trailing)
            }
            if user.information.workPlaceAddress.fa != "" {
                Text("آدرس محل کار :")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 16))
                    .foregroundColor(Color("marshal_White"))
                    .padding(.horizontal, 16.0)
                    .padding(.bottom)
                    .padding()
                    .multilineTextAlignment(.trailing)
                
                
                Text(user.information.workPlaceAddress.fa)
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 16))
                    .foregroundColor(Color("marshal_red"))
                    .padding(.horizontal, 16.0)
                    .padding(.bottom)
                    .padding()
                    .multilineTextAlignment(.trailing)
                
            }
            
            
            if user.information.workPlaceTelephone != "" {
                Text("تلفن تماس:")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 16))
                    .foregroundColor(Color("marshal_White"))
                    .padding(.horizontal, 16.0)
                    .padding(.bottom)
                    .padding()
                    .multilineTextAlignment(.trailing)
                
                
                Text(user.information.workPlaceTelephone)
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 16))
                    .foregroundColor(Color("marshal_red"))
                    .padding(.horizontal, 16.0)
                    .padding(.bottom)
                    .padding()
                    .multilineTextAlignment(.trailing)
                
            }
        }//:VSTACK
        .frame(minWidth: 0, maxWidth: .infinity)
    }
    
    var educationInformation : some View {
        VStack{
            if user.information.degreeOfEducationImage != "" {
                DownloadImage(imageName: $user.information.degreeOfEducationImage)
                
            }else {
                Text("شما هنوز عکس مدارک خود را بارگذاری نکرده‌اید ")
                    .font(Font.custom("IRANSansMobileFaNum Medium", size: 16))
                    .foregroundColor(Color("marshal_White"))
                    .padding(.horizontal, 16.0)
                    .padding(.bottom)
                    .padding()
                    .multilineTextAlignment(.trailing)
            }
            
            if user.information.educationStatus != "" {
                HStack{
                    
                    Text(user.information.educationStatus)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 16))
                        .foregroundColor(Color("marshal_White"))
                        .padding(.horizontal, 16.0)
                        .multilineTextAlignment(.trailing)

                    Image("check-circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 15, height: 15, alignment: .center)
                    
                    
                    Spacer()
                    Text("وضعیت تحصیلی")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 16))
                        .foregroundColor(Color("marshal_White"))
                        .padding(.horizontal, 16.0)
                        .multilineTextAlignment(.trailing)
                    
                   
                    
                    

                }//:HSTACK
            }
            
                HStack{
                    
                 
                    Text("کارشناسی")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 16))
                        .foregroundColor(Color("marshal_red"))
                        .padding(.horizontal, 16.0)
                        .padding(.vertical, 16)
                        .multilineTextAlignment(.trailing)
                    
                    Spacer()
                    
                    Text("آخرین مدرک تحصیلی")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 16))
                        .foregroundColor(Color("marshal_White"))
                        .padding(.horizontal, 16.0)
                        .multilineTextAlignment(.trailing)
                }//:HSTACK
            if user.information.fieldOfStudy.fa != ""{
                HStack{
                    Text(user.information.fieldOfStudy.fa)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 16))
                        .foregroundColor(Color("marshal_red"))
                        .padding(.horizontal, 16.0)
                        .multilineTextAlignment(.trailing)
                    Spacer()

                    
                    Text("رشته تحصیلی")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 16))
                        .foregroundColor(Color("marshal_White"))
                        .padding(.horizontal, 16.0)
                        .padding(.vertical, 16)
                        .multilineTextAlignment(.trailing)
                
               
                    

                }//:HSTACK

            }
        
            if user.information.universityName.fa != ""{
                HStack{
                    
         
                    Text(user.information.universityName.fa)
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 16))
                        .foregroundColor(Color("marshal_red"))
                        .padding(.horizontal, 16.0)
                        .multilineTextAlignment(.trailing)
                    
                    Spacer()
                    
                    Text("آخرین دانشگاه محل تحصیل")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 16))
                        .foregroundColor(Color("marshal_White"))
                        .padding(.horizontal, 16.0)
                        .padding(.vertical, 16)
                        .multilineTextAlignment(.trailing)

                }//:HSTACK

            }
            
        }//:VSTACK
        .frame(minWidth: 0, maxWidth: .infinity)
    }
    
    //MARK: -BODY
    var body: some View {
        
        ZStack(alignment: .center){
            if status == .Successful {
                ScrollView {
                    VStack(spacing : 0){
                        HStack{
                            userCard
                                .padding(.top,44)
                                .padding(.horizontal, 24)
                        }
                        .background(Image("backforprofile").resizable())
                        
                        harvestRow
                        
                        depositRow
                        
                        HStack{
                            Spacer()
                            Text("مشخصات کاربری")
                                .font(Font.custom("IRANSansMobileFaNum Medium", size: 16))
                                .padding(.horizontal, 16.0)
                                .padding(.bottom , 16)
                                .padding()
                                .multilineTextAlignment(.trailing)
                                .foregroundColor(Color("marshal_White"))
                            Spacer()
                        }
                        .background(Image("backforinformation").resizable())
                        
                        stepBar
                        VStack{
                            Group{
                                if pages.imagesLevel {
                                    identificationCardImage
                                }
                                if pages.englishLevel {
                                    englishInformation
                                }
                                if pages.persianLevel{
                                    pertianInformation
                                }
                            }
                         
                            Group{
                                if pages.educationLevel{
                                    educationInformation
                                }
                                
                                if pages.jobLevel {
                                    jabInformation
                                }
                            }
                          
                            Spacer()
                        }.background(Image("back_for_information").resizable())
                            .padding(16)
                     
                        
                    }
                    .background(Color("marshal_darkGrey"))
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
