//
//  TransactionModule.swift
//  Marshal
//
//  Created by mohammad blor on 3/14/22.
//

import SwiftUI
import Alamofire
import SwiftyJSON
struct TransactionModule: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var increase : Bool
    @State var loading = false
    @State var transactions = [Transaction]()
    @State var statusOfPage : Status = .none
    @State var nummberOfPage : Int = 0
    
    var topBar : some View {
        HStack(alignment: .center) {
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image (systemName: "arrow.backward")
                    .frame(width: 40, height: 40, alignment: .leading)
                    .foregroundColor(Color("marshal_red"))
                    .imageScale(.large)
            }

  

            Spacer()
            
            Text("صرافی")
                
                .foregroundColor(Color("marshal_White"))
                .font(Font.custom("IRANSansMobileFaNum Bold", size: 18))
            
  
        }
        .padding(.horizontal, 16.0)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 56)

    }
    
    var body: some View {
        VStack{
            
            
            
            
            RefreshableScrollView(height: 70, refreshing: $loading) {
                LazyVStack{
                    if transactions.isEmpty {
                        Text("شما هیج تراکنشی انجام نداده‌اید")
                            .font(Font.custom("IRANSansMobileFaNum Medium", size: 14.0))
                            .multilineTextAlignment(.trailing)
                            .padding()
                            .foregroundColor(Color("marshal_red"))
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }else{
                        ForEach(transactions){item in
                            TransactionRow(transaction: item)
                                .shadow(color: Color.black, radius: 2, x: 4, y: 4  )
                                .padding(.vertical, 8)
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

    }
    //MARK: -FUNCTION
    
    func onCreate(){
        nummberOfPage = 0
        transactions.removeAll()
        loadMore()
    }
    
    func loadMore(){
        
        nummberOfPage += 1
        
        let headers: HTTPHeaders?
        
        headers = [
            "Authorization": "Bearer \(CallApi().acceceToken)"
        ]
        
        AF.request(CallApi().baceUrl + "v1/transactions/search?pageNumber=" + String(nummberOfPage) + "&mode=" + (increase ? "increase" : "decrease"), method: .get, encoding: JSONEncoding.default , headers: headers){urlRequest in urlRequest.timeoutInterval = TimeInterval(CallApi().timeOut)}.responseJSON { response in
            do {
                switch response.result {
                case .success :
                    let json = try JSON(data: response.data!)
                    print("------ send code")
                    print(json)
                    print("------- send code")
                    if response.response?.statusCode == 200 || response.response?.statusCode == 201  {
                        transactions += ConvertJsonToObject().convertJsonToTransactions(json["data"])
                        statusOfPage = .Successful
                    }else{
                        statusOfPage = .Failure
                    }
                    print(CallApi().baceUrl + "v1/transactions/search?pageNumber=1&mode=increase")
                    print(response.response?.statusCode ?? 0)

                    break
                case let .failure(error):
                    print(CallApi().baceUrl + "v1/transactions/search?pageNumber=1&mode=increase")
                    statusOfPage = .Failure
                    if response.response != nil {
                        print(response.response?.statusCode ?? 0 )
                    }
                    print("failed")
                    print(error)
                    break
                }
            }catch{
                print(CallApi().baceUrl + "v1/transactions/search?pageNumber=1&mode=increase")
                statusOfPage = .Failure
                if response.response != nil {
                    print(response.response?.statusCode ?? 0)
                }
                print("nil response")
            }
            
        }
        
    }
}

struct TransactionModule_Previews: PreviewProvider {
    static var previews: some View {
        TransactionModule(increase: true)
    }
}
