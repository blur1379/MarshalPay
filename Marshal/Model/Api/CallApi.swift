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
struct CallApi{
    public var baceUrl = "https://marshal-pay.iran.liara.run/api/"
    public var baceUrlDownload = "https://marshal-pay.iran.liara.run/downloads/"
    var timeOut = 20
    public static var uploadTimeOut = 30
 
    // func 
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
                        statusApi = .Successful
                        
                    }else{
                        statusApi = .Failure
                    }
                    
                                        
                    print(baceUrl + "v2/Authentication/Home")
                    print(response.response?.statusCode ?? 0)

                    
                    break
                case let .failure(error):
                    print(baceUrl + "v2/Authentication/Home")
                    statusApi = .Failure
                    if response.response != nil {
                        print(response.response?.statusCode ?? 0 )
                    }
                    print("failed")
                    print(error)
                    break
                }
            }catch{
                print(baceUrl + "v2/Authentication/Home")
                statusApi = .Failure
                if response.response != nil {
                    print(response.response?.statusCode ?? 0)
                }
                print("nil response")
            }
            
        }
        status(statusApi)
    }
    
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
    
    func uploadImage(photo: Photo,apiPhoto : @escaping((Photo)->()),status : @escaping ((Status)->())) -> () {
    status(.InProgress)
    AF.upload(multipartFormData: { multipartFormData in
        multipartFormData.append(photo.uiImage.compress(to: 200), withName: "photo", fileName: "a.jpeg", mimeType: "image/jpg")
    }, to: baceUrl + "v1/files/upload", method: .post){urlRequest in urlRequest.timeoutInterval = TimeInterval(CallApi.uploadTimeOut)}
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
                            photo.fileName = json["data"]["_id"].string!
                        }
                        if json["data"]["filename"].exists() {
                            photo.id = json["data"]["filename"].string!
                        }
                    }
                    apiPhoto(photo)
                    status(.Successful)
            
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
    func searchCurrency(numberOfPage : Int , sortMode : String , searchText : String,status : @escaping ((Status)->())){
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
}
