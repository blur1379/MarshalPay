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
    @State var nummberOfPage : Int = 0
    var body: some View {
        RefreshableScrollView(height: 70, refreshing: $loading) {
            LazyVStack{
                if histories.isEmpty {
                    Text("شما هیج تراکنشی انجام نداده‌اید")
                        .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                        .multilineTextAlignment(.trailing)
                        .padding()
                        .foregroundColor(Color("marshal_red"))
                        .frame(minWidth: 0, maxWidth: .infinity)
                }else{
                    ForEach(histories){item in
                        HistoyRow(history: item)
                    }// end loop
                }
            
                
                if statusOfPage == .InProgress {
                    ProgressViewMarshal()
                }
                Text("").onAppear {
                    loadMore()
                }
            }
        }.background(Color("marshal_darkGrey"))
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
        nummberOfPage = 0
        histories.removeAll()
        loadMore()
    }
    
    func loadMore(){
        
        nummberOfPage += 1
        
        let headers: HTTPHeaders?
        
        headers = [
            "Authorization": "Bearer \(CallApi().acceceToken)"
        ]
        
        AF.request(CallApi().baceUrl + "v1/change-currency-transactions/search?pageNumber=" + String(nummberOfPage), method: .get, encoding: JSONEncoding.default , headers: headers){urlRequest in urlRequest.timeoutInterval = TimeInterval(CallApi().timeOut)}.responseJSON { response in
            do {
                switch response.result {
                case .success :
                    let json = try JSON(data: response.data!)
                    print("------ send code")
                    print(json)
                    print("------- send code")
                    if response.response?.statusCode == 200 || response.response?.statusCode == 201  {
                        histories += ConvertJsonToObject().convertJsonToHistores(json["data"])
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
