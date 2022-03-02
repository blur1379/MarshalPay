//
//  CallApi.swift
//  Marshal
//
//  Created by Blur on 12/24/21.
//
import SwiftUI
import Foundation
import SwiftyJSON
import Alamofire
#if canImport(FoundationNetworking)
import FoundationNetworking
#endif
struct CallApi{
    @AppStorage("showLogin") var showLogin = false
    public var baceUrl = "https://marshal-pay.iran.liara.run/api/"
    public var baceUrlDownload = "https://marshal-pay.iran.liara.run/download/"
    var timeOut = 20
    public static var uploadTimeOut = 30
    let converter = ConvertJsonToObject()
    @AppStorage("acc") var acceceToken = ""
    // for send code
    func SendActivationCode(phoneNumber: String , status : @escaping ((Status)->())){
        var statusApi : Status = .InProgress
        let parameters: [String: Any] = [
            "mobile": phoneNumber
        ]
        AF.request(baceUrl + "v1/users/send-activation-code", method: .post, parameters: parameters ,encoding: JSONEncoding.default){urlRequest in urlRequest.timeoutInterval = TimeInterval(timeOut)}.responseJSON { response in
            do {
                switch response.result {
                case .success :
                    let json = try JSON(data: response.data!)
                    print("------ send code")
                    print(json)
                    print("------- send code ")
                    if response.response?.statusCode == 200 || response.response?.statusCode == 201  {
                        status(.Successful)
                        
                    }else{
                        status(.Failure)
                    }
                    
                                        
                    print(baceUrl + "v2/Authentication/Home")
                    print(response.response?.statusCode ?? 0)

                    
                    break
                case let .failure(error):
                    print(baceUrl + "v2/Authentication/Home")
                    status(.Failure)
                    if response.response != nil {
                        print(response.response?.statusCode ?? 0 )
                    }
                    print("failed")
                    print(error)
                    break
                }
            }catch{
                print(baceUrl + "v2/Authentication/Home")
                status(.Failure)
                if response.response != nil {
                    print(response.response?.statusCode ?? 0)
                }
                print("nil response")
            }
            
        }
        
    }
    
    // for validation code
    func sendVerificstionCode(phoneNumber: String ,verificationCode: String, status : @escaping ((Status)->())){
        let parameters: [String: Any] = [
            "mobile": phoneNumber,
            "otp": verificationCode
        ]
        AF.request(baceUrl + "v1/users/validation-activation-code", method: .patch, parameters: parameters ,encoding: JSONEncoding.default){urlRequest in urlRequest.timeoutInterval = TimeInterval(timeOut)}.responseJSON { response in
            do {
                switch response.result {
                case .success :
                    let json = try JSON(data: response.data!)
                    print("------ send code")
                    print(json)
                    print("------- send code ")
                    if response.response?.statusCode == 200 || response.response?.statusCode == 201  {
                        if json["data"].exists(){
                            if json["data"]["tokens"].exists(){
                                if json["data"]["tokens"].exists(){
                                    if json["data"]["tokens"]["accessToken"].exists(){
                                        acceceToken = json["data"]["tokens"]["accessToken"].string!
                                        showLogin = false
                                    }
                                    if json["data"]["tokens"]["refreshToken"].exists(){
                                    }
                                }
                            }
                        }
                        status(.Successful)
                        
                    }else{
                        status(.Failure)
                    }
                    
                                        
                    print(baceUrl + "v1/users/validation-activation-code")
                    print(response.response?.statusCode ?? 0)

                    break
                case let .failure(error):
                    print(baceUrl + "v1/users/validation-activation-code")
                    status(.Failure)
                    if response.response != nil {
                        print(response.response?.statusCode ?? 0 )
                    }
                    print("failed")
                    print(error)
                    break
                }
            }catch{
                print(baceUrl + "v1/users/validation-activation-code")
                status(.Failure)
                if response.response != nil {
                    print(response.response?.statusCode ?? 0)
                }
                print("nil response")
            }
            
        }
    }
    
    // for uploads file
    func uploadImage(image : UIImage,apiPhoto : @escaping((Photo)->()),status : @escaping ((Status)->())) -> () {
        let innerPhoto : Photo = Photo()
        let parameters: [String: Any] = [:]
        var headers: HTTPHeaders?
        
        headers = [
            "Authorization": "Bearer \(acceceToken)"
        ]
    status(.InProgress)
    AF.upload(multipartFormData: { multipartFormData in
        multipartFormData.append(image.jpegData(compressionQuality: 0.4)!, withName: "file", fileName: "file.jpeg", mimeType: "image/jpg")
        for (key, val) in parameters {
            multipartFormData.append((val as AnyObject).data(using: String.Encoding.utf8.rawValue)!, withName: key)
        }
    }, to: baceUrl + "v1/files/upload", method: .post , headers: headers){urlRequest in urlRequest.timeoutInterval = Double.infinity }
    .response { response in
        do {
            switch response.result {
            case .success:
                let json = try JSON(data: response.data!)
                print("*----------------------------- v1/photos/upload ------------------------------*")
                print(json)
                print("*--------------------------------- v1/photos/upload ---------------------------*" )
                if response.response?.statusCode == 201 || response.response?.statusCode == 200 {
                    if json["data"].exists() {
                        if json["data"]["_id"].exists() {
                            innerPhoto.id = json["data"]["_id"].string!
                        }
                        if json["data"]["fileName"].exists() {
                            innerPhoto.fileName = json["data"]["fileName"].string!
                        }
                    }
                    apiPhoto(innerPhoto)
                    status(.Successful)
            
                }else if response.response?.statusCode == 401{
                    showLogin = true
                    status(.Failure)
                    print(response)
                }else {
                    status(.Failure)
                    print(response)
                }
                print( "v1/photos/upload")
                
    
                break
            case let .failure(error):
                // handle bad request
                status(.Failure)
                print("v1/photos/upload")
                if response.response != nil {
                    print(response.response?.statusCode ?? 0)
                }
                print("failed")
                print(error)
                break
            }
        }catch{
            status(.Failure)
            if response.response != nil {
                print(response.response?.statusCode ?? 0)
            }
            print("nil response")
            
        }
    }
}
    
    // for get and search currency
    func searchCurrency(numberOfPage : Int , sortMode : String , searchText : String,status : @escaping ((Status)->()) , currencies : @escaping (([Currency])->())){
        var url = "v1/currencies/search?pageNumber=\(numberOfPage)&limit=10"
        if !sortMode.isEmpty {
            url += "&sortMode=" + sortMode
        }
        if !searchText.isEmpty{
            url += "&searchText=" + searchText
        }
        AF.request(baceUrl + url, method: .get, encoding: JSONEncoding.default){urlRequest in urlRequest.timeoutInterval = TimeInterval(timeOut)}.responseJSON { response in
            do {
                switch response.result {
                case .success :
                    let json = try JSON(data: response.data!)
                    print("------ send code")
                    print(json)
                    print("------- send code")
                    if response.response?.statusCode == 200 || response.response?.statusCode == 201  {
                        let apiCurrency = converter.convertJsonToCurrenies(json["data"]["docs"])
                        currencies(apiCurrency)
                        status(.Successful)
                    }else{
                        status(.Failure)
                    }
                    print(baceUrl + "v1/users/validation-activation-code")
                    print(response.response?.statusCode ?? 0)

                    break
                case let .failure(error):
                    print(baceUrl + "v1/users/validation-activation-code")
                    status(.Failure)
                    if response.response != nil {
                        print(response.response?.statusCode ?? 0 )
                    }
                    print("failed")
                    print(error)
                    break
                }
            }catch{
                print(baceUrl + "v1/users/validation-activation-code")
                status(.Failure)
                if response.response != nil {
                    print(response.response?.statusCode ?? 0)
                }
                print("nil response")
            }
            
        }
    }
    
    func getWallet(wallet: @escaping ((WalletModel)->Void), status: @escaping((Status)->Void)){
        let url = "v1/transactions/get-user-wallet"
        let headers: HTTPHeaders?
        
        headers = [
            "Authorization": "Bearer \(acceceToken)"
        ]
        AF.request(baceUrl + url, method: .get, encoding: JSONEncoding.default,headers: headers){urlRequest in urlRequest.timeoutInterval = TimeInterval(timeOut)}.responseJSON { response in
            do {
                switch response.result {
                case .success :
                    let json = try JSON(data: response.data!)
                    print("------ send code")
                    print(json)
                    print("------- send code")
                    if response.response?.statusCode == 200 || response.response?.statusCode == 201  {
                        let apiWallet = converter.convrtJsonToWallet(json["data"])
                        wallet(apiWallet)
                        status(.Successful)
                    }else if response.response?.statusCode == 401{
                        showLogin = true
                        status(.Failure)
                        print(response)
                    }else{
                        status(.Failure)
                    }
                    print(baceUrl + "v1/users/validation-activation-code")
                    print(response.response?.statusCode ?? 0)

                    break
                case let .failure(error):
                    print(baceUrl + "v1/users/validation-activation-code")
                    status(.Failure)
                    if response.response != nil {
                        print(response.response?.statusCode ?? 0 )
                    }
                    print("failed")
                    print(error)
                    break
                }
            }catch{
                print(baceUrl + "v1/users/validation-activation-code")
                status(.Failure)
                if response.response != nil {
                    print(response.response?.statusCode ?? 0)
                }
                print("nil response")
            }
            
        }
    }
    
    // get user levels
    func getUserLevels(userLevels: @escaping (([UserLevelModel])->Void), status: @escaping((Status)->Void)){
        let url = "v1/user-level/search"
        let headers: HTTPHeaders?
        
        headers = [
            "Authorization": "Bearer \(acceceToken)"
        ]
        AF.request(baceUrl + url, method: .get, encoding: JSONEncoding.default,headers: headers){urlRequest in urlRequest.timeoutInterval = TimeInterval(timeOut)}.responseJSON { response in
            do {
                switch response.result {
                case .success :
                    let json = try JSON(data: response.data!)
                    print("------ send code")
                    print(json)
                    print("------- send code")
                    
                    if response.response?.statusCode == 200 || response.response?.statusCode == 201  {
                        let apiUserLevels = converter.convertJsonToUserLevels(json["data"]["docs"])
                        userLevels(apiUserLevels)
                        status(.Successful)
                    }else if response.response?.statusCode == 401{
                        showLogin = true
                        status(.Failure)
                        print(response)
                    }else {
                        status(.Failure)
                    }
                    print(baceUrl + "v1/users/validation-activation-code")
                    print(response.response?.statusCode ?? 0)

                    break
                case let .failure(error):
                    print(baceUrl + "v1/users/validation-activation-code")
                    status(.Failure)
                    if response.response != nil {
                        print(response.response?.statusCode ?? 0 )
                    }
                    print("failed")
                    print(error)
                    break
                }
            }catch{
                print(baceUrl + "v1/users/validation-activation-code")
                status(.Failure)
                if response.response != nil {
                    print(response.response?.statusCode ?? 0)
                }
                print("nil response")
            }
            
        }
    }
    
    // insert user information
    func updateProfile(user : User , status: @escaping((Status)->Void)){
        let url = "v1/users/update-profile"
        let headers: HTTPHeaders?
        
        headers = [
            "Authorization": "Bearer \(acceceToken)"
        ]
        
        let parameters: [String: Any] = [
        "firstName": [
            "fa" : user.firstName.fa,
            "en" : user.firstName.en
          ],
          "lastName": [
            "fa" : user.lastName.fa,
            "en" : user.lastName.en
          ],
        "userName" : user.userName,
          "information": [
            "nationalCode" : user.information.nationalCode,
            "birthDate" : user.information.birthDate,
            "job": [
                "fa" : user.information.jab.fa,
                "en" : user.information.jab.en
            ],
            "residencePostalCode" : user.information.residencePostalCode,
            "residenceTelephone": user.information.residenceTelephone,
            "alternativeMobile": user.information.alternativeMobile,
            "street": [
                "fa": user.information.street.fa,
                "en": user.information.street.en
            ],
            "city": [
                "fa": user.information.city.fa,
                "en": user.information.city.en
            ],
            "state": [
                "fa": user.information.state.fa,
                "en": user.information.state.en
            ],
            "residenceAddress": [
                "fa": user.information.residenceAddress.fa,
                "en": user.information.residenceAddress.en
            ],
            "profileImage": user.information.profileImage,
            "identificationCardImage": user.information.identificationCardImage,
            "workPlaceAddress": [
                "fa": user.information.workPlaceAddress.fa,
                "en": user.information.workPlaceAddress.en
            ],
            "workPlaceTelephone": user.information.workPlaceTelephone,
            "educationStatus": user.information.educationStatus,
            "fieldOfStudy": [
                "fa": user.information.fieldOfStudy.fa,
            ],
            "degreeOfEducationImage": user.information.degreeOfEducationImage,
            "universityName": [
                "fa": user.information.universityName.fa,
            ]
          ]]

        AF.request(baceUrl + url, method: .post,parameters: parameters , encoding: JSONEncoding.default,headers: headers){urlRequest in urlRequest.timeoutInterval = TimeInterval(timeOut)}.responseJSON { response in
            do {
                switch response.result {
                case .success :
                    let json = try JSON(data: response.data!)
                    print("------ send code")
                    print(json)
                    print("------- send code")
                    
                    if response.response?.statusCode == 200 || response.response?.statusCode == 201  {
                        status(.Successful)
                    }else if response.response?.statusCode == 401{
                        showLogin = true
                        status(.Failure)
                        print(response)
                    }else {
                        status(.Failure)
                    }
                    print(baceUrl + "v1/users/validation-activation-code")
                    print(response.response?.statusCode ?? 0)

                    break
                case let .failure(error):
                    print(baceUrl + "v1/users/validation-activation-code")
                    status(.Failure)
                    if response.response != nil {
                        print(response.response?.statusCode ?? 0 )
                    }
                    print("failed")
                    print(error)
                    break
                }
            }catch{
                print(baceUrl + "v1/users/validation-activation-code")
                status(.Failure)
                if response.response != nil {
                    print(response.response?.statusCode ?? 0)
                }
                print("nil response")
            }
            
        }
    }
    
}
