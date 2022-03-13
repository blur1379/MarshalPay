//
//  HistoryModule.swift
//  Marshal
//
//  Created by Blur on 2/13/22.
//

import SwiftUI
import SwiftyJSON
import Alamofire

struct HistoryModule: View {
    @State var loading = false
    @State var histories = [HistoryModel]()
    @State var statusOfPage : Status = .none
    var body: some View {
        RefreshableScrollView(height: 70, refreshing: $loading) {
            LazyVStack{
                ForEach(histories){item in
                    HistoyRow(history: item)
                }// end loop
                
                if statusOfPage == .InProgress {
                    ProgressViewMarshal()
                }
                Text("").onAppear {
                    loadMore()
                }
            }
        }
        .onChange(of: loading, perform: { newValue in
            if loading == true {
                
                onCreate()
            }
        })
        .onAppear {
            onCreate()
        }

    }
    //MARK: -FUNCTION
    func onCreate(){
        
    }
    func loadMore(){
        
        
        let headers: HTTPHeaders?
        
        headers = [
            "Authorization": "Bearer \(CallApi().acceceToken)"
        ]
        AF.request(CallApi().baceUrl , method: .get, encoding: JSONEncoding.default , headers: headers){urlRequest in urlRequest.timeoutInterval = TimeInterval(CallApi().timeOut)}.responseJSON { response in
            do {
                switch response.result {
                case .success :
                    let json = try JSON(data: response.data!)
                    print("------ send code")
                    print(json)
                    print("------- send code")
                    if response.response?.statusCode == 200 || response.response?.statusCode == 201  {
//                      converter.convertJsonToCurrenies(json["data"]["docs"])
                    
                        statusOfPage = .Successful
                    }else{
                        statusOfPage = .Failure
                    }
                    print(CallApi().baceUrl + "v1/users/validation-activation-code")
                    print(response.response?.statusCode ?? 0)

                    break
                case let .failure(error):
                    print(CallApi().baceUrl + "v1/users/validation-activation-code")
                    statusOfPage = .Failure
                    if response.response != nil {
                        print(response.response?.statusCode ?? 0 )
                    }
                    print("failed")
                    print(error)
                    break
                }
            }catch{
                print(CallApi().baceUrl + "v1/users/validation-activation-code")
                statusOfPage = .Failure
                if response.response != nil {
                    print(response.response?.statusCode ?? 0)
                }
                print("nil response")
            }
            
        }
        
    }
}

struct HistoryModule_Previews: PreviewProvider {
    static var previews: some View {
        HistoryModule()
    }
}
