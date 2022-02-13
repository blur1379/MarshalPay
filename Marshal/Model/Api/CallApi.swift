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
    public var baceUrlDownload = "https://marshal-pay.iran.liara.run/downloads/"
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
        let parameters: [String: Any] = [
            "key": "file",
            "src": "/Users/blur/Downloads/WhatsApp Image 2022-01-04 at 2.54.35 PM.jpeg",
            "type": "file"
        ]
        var headers: HTTPHeaders?
        
        headers = [
            "Authorization": "Bearer \(acceceToken)"
        ]
    status(.InProgress)
    AF.upload(multipartFormData: { multipartFormData in
        multipartFormData.append(image.compress(to: 200), withName: "photo", fileName: "a.jpeg", mimeType: "image/jpg")
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
                            innerPhoto.fileName = json["data"]["_id"].string!
                        }
                        if json["data"]["filename"].exists() {
                            innerPhoto.id = json["data"]["filename"].string!
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
    
    func apiForUploadImagePostman(image : UIImage , status : @escaping ((Status)->()) , fileName : @escaping ((String)->()))  {
        var semaphore = DispatchSemaphore (value: 0)

        let parameters = [
          [
            "key": "file",
            "src": "/Users/blur/Downloads/WhatsApp Image 2022-01-04 at 2.54.35 PM.jpeg",
            "type": "file"
          ]] as [[String : Any]]

        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
        var error: Error? = nil
        for param in parameters {
          if param["disabled"] == nil {
            let paramName = param["key"]!
            body += "--\(boundary)\r\n"
            body += "Content-Disposition:form-data; name=\"\(paramName)\""
            if param["contentType"] != nil {
              body += "\r\nContent-Type: \(param["contentType"] as! String)"
            }
            let paramType = param["type"] as! String
            if paramType == "text" {
              let paramValue = param["value"] as! String
              body += "\r\n\r\n\(paramValue)\r\n"
            } else {
              let paramSrc = param["src"] as! String
//              let fileData = try! NSData(contentsOfFile:paramSrc, options:[]) as Data
                let fileData : Data = image.pngData()!
              let fileContent = String(data: fileData, encoding: .utf8) ?? ""
              body += "; filename=\"\(paramSrc)\"\r\n"
                + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
            }
          }
        }
        body += "--\(boundary)--\r\n";
        let postData = body.data(using: .utf8)

        var request = URLRequest(url: URL(string: "https://marshal-pay.iran.liara.run/api/v1/files/upload")!,timeoutInterval: Double.infinity)
            
        request.addValue("Bearer U2FsdGVkX1+Cci6wP3Vx126n0LHtdWDgcypPY78mQXMZM3xm+UIbNY8TpUQ+oa9HEK2FzyClFHNon8/0HRmXEXhmLzS8Vlz1ODulrVfuBHhBNiKAET1U1dhitIUF5DiWmGZzL7rdcapPmTElMPsLqNd0EsLSNZRtd5kv8b5pIiSEaG1/LE/TO/f7LoNlOKTbxJl2kfnSgTjjlw3c1snVBa5nBkcTS37gzSUV8zegABvW/uQlMb2EwFjZAAz24/ITExuEg1Y+zL7NjtgqjYCxjavW8eb8MXMz5ozhA2EcxzGxjg4er6MCIZwvs0ANvy6kWbgQX+Xevsrzy8e8isYfBM+8KZXAnrr5vQt8JV+0+ruqsMW3CZrB2GhXRVW3arU0LTTo0fvDCxnow+jhgV9I09hZeKr4xSa/rpGCH6lKDii+IUakOJ0YQFwUBbVA/ehU6n5eCGMLkihvWvUni6QVjRLbegPpnC3H+5Pc5Ik5wbT3wqJ2WnuR/HkNzz7PnbnYecS7s/DLKGQedQSAKkZOtXrngA2Ph5RQY13BG6Cgi/Ku3/aizFxfrXcylvGeuH2EV/m+QqxhSQPIfkPEEPT3N33TpYpRURw/rwODbyV7d4L18rc9csYhoCT4DozaN2YN9o8zZw7Kbqpz8rWRECI9C9CPxEyprN4sIZp9jsfEaSm2fDAi9+FO2Egdyy8/r0ZIhGxnM4eAt6McOdoLEvN6TBFXcrfrN1dAefeaAWBUpB1bmdjpWCLTt2BRhJg/ER8mrOQ1qFMS7motG0g6irCOgUQNqS2p2KPwXurViUOzws0=", forHTTPHeaderField: "Authorization")
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
            print(String(describing: error))
            semaphore.signal()
            return
            }
            if let httpResponse = response as? HTTPURLResponse {
                print("error \(httpResponse.statusCode)")
                if httpResponse.statusCode == 201 || httpResponse.statusCode == 200 {
                    print("-----------------json responce--------------")
                    let json = try! JSON(data: data)
                    print(json)
                    if json["data"].exists(){
                        if json["data"]["fileName"].exists(){
                            fileName(json["data"]["fileName"].string!)
                            print(json["data"]["fileName"].string!)
                        }
                    }
                    print("------------------json responce----------------")
                    status(.Successful)
                }else{
                    status(.Failure)
                }
            }
 
          semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()

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
