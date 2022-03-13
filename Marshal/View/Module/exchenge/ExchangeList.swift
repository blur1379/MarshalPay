//
//  ExchangeList.swift
//  Marshal
//
//  Created by Blur on 10/17/1400 AP.
//

import SwiftUI

struct ExchangeList: View {
    //MARK: - PROPERTISE
    @State var currencies = [Currency]()
    @State var numberOfPage = 0
    @State var sortMode = ""
    @State var searchText = ""
    @State var statusOfPage : Status = .Successful
    @State var loading: Bool = false
    let callApi = CallApi()
    //MARK: - BODY
    var body: some View {
        if statusOfPage != .Failure{
            RefreshableScrollView(height: 70, refreshing: $loading){
                LazyVStack(spacing: 0){
                    ForEach(currencies , id: \._id){currency in
                            
                                NavigationLink {
                                    ExchangePage(currencyId: currency._id)
                                        .navigationBarHidden(true)
                                } label: {
                                    MarshalTrendingListEachRow(currency: currency)
                                        .padding(4)
                                }
                              

                            
                    }//ENDLOOP
                    if statusOfPage == .InProgress {
                        ProgressViewMarshal()
                    }
                    Text("").onAppear {
                        loadMore()
                    }
                }//:LAZYVSTACK
                .padding(.top , 8)
            }//:SCROLLVIEW
            .onChange(of: loading, perform: { newValue in
                if loading == true {
                    
                    onCreate()
                }
            })
            .onAppear {
                onCreate()
            }

        }else{
            ZStack(alignment: .center) {
                FailedMarshal {
                   numberOfPage = numberOfPage - 1
                    loadMore()
                }
            }
        }
    }
    //MARK: - FUNCTION
    func loadMore(){
        statusOfPage = .InProgress
        numberOfPage += 1
        callApi.searchCurrency(numberOfPage: numberOfPage, sortMode: sortMode, searchText: "") { status in
            statusOfPage = status
            if loading {
                if status == .Successful || status == .Failure {
                    loading = false
                }
            }
           
        } currencies: { currencies in
            self.currencies += currencies
        }

    }
    func onCreate(){
        numberOfPage = 0
        currencies = []
        loadMore()
    }
    
}


//MARK: - PREVIEW
struct ExchangeList_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeList()
    }
}
