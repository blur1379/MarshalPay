//
//  CallApi.swift
//  Marshal
//
//  Created by Blur on 12/24/21.
//

import Foundation
import SwiftyJSON
import Alamofire
struct CallApi{
    public var baceUrl = "https://marshal-pay.iran.liara.run/api/"
    var timeOut = 20
    // func 
    func SendActivationCode(phoneNumber: String , status : @escaping ((Status)->())){
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
                    
                                        
                    print(baceUrl + "v1/users/send-activation-code")
                    print(response.response?.statusCode ?? 0)

                    
                    break
                case let .failure(error):
                    print(baceUrl + "v1/users/send-activation-code")
                    status(.Failure)
                    if response.response != nil {
                        print(response.response?.statusCode ?? 0 )
                    }
                    print("failed")
                    print(error)
                    break
                }
            }catch{
                print(baceUrl + "v1/users/send-activation-code")
                status(.Failure)
                if response.response != nil {
                    print(response.response?.statusCode ?? 0)
                }
                print("nil response")
            }
            
        }
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
}
