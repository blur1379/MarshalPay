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
    public var baceUrl = "https://marshal-pay.iran.liara.run/api/"
    public var baceUrlDownload = "https://marshal-pay.iran.liara.run/download/"
    var timeOut = 20
    public static var uploadTimeOut = 30
    let converter = ConvertJsonToObject()
    @AppStorage("acc") var acceceToken = "U2FsdGVkX18U2sMmMDwpsOZpGposc1CrkPxnT21NrbP3OK0knhgYTcnz871oBsoUsy6DGjdZIWkRw40F2Wp3tY1L0rJScEi3aBwxu8mu1y6C8C6pcP0aBLHSsI2OKnmh6bKvG8WfZJ+5RtPL710b3HYKglNBmC0lFNwn4CTy8H/rjuoZAOP/e4XOwhZlbFYZWg/fPgQcTMBQwe0nDgFJZswbHqSBc8w/YXV5sjOaC8D/ELbhymSbLA2qy8pv+WV7RsIAS8r95zXqvVrQXJ+W/aOAI4sLz1jz/ve3/xr5eIxj1JVreRhOy3V4vYnQsXVlkCw4P847Z+5xCpxw/T4qXbKj4QYVvAyxxwfpL2mB5HPopBxP0byP49koypZVt/PxOrr1NCcj7Q7ETKMjztLgKSBdxP+cAJXvcMjPybuYz94YwRiCnXJZBTDoik4rKh07EyfnUa1X5LZhWGQfbgAjA92zI64IeEw5yRbuKewUuaDdlwu36lURfjhFkSQK4ChKmi8EFj7BwMPV6EpUSTmECf50wU+16vHly4oRctcpTQIK3I8an2zPBsd5QjR+tDLnOVcOsLsZ33LXx7AiBIy5jI/q2tOC/52QxxHJ+yX9FlX/g7LN+HEHAwBDMjv+Ay4QKnD+tnvKUxcPwa9XuMeBHWtt2bCjh4c6lrJLjm+eTOEZBzWNRlVbzOWbqEI0elfNR6gjfwuCJ3wKuQh12OLfkQaxrjnopR8eoyy3OigExSFBCjeO5GoC9XVZ+Tbpq0n72KwGEA0i8Nf/UWtoE29BoQgVaZNea5m/Kx9H0zWjp8o="
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
