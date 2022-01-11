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
    @State var statusOfPage : Status = .none
    let callApi = CallApi()
    //MARK: - BODY
    var body: some View {
        ScrollView{
            LazyVStack{
                ForEach(currencies , id: \._id){currency in
                    MarshalTrendingListEachRow(currency: currency)
                }//ENDLOOP
                Text("").onAppear {
                    loadMore()
                }
            }//:LAZYVSTACK
        }//:SCROLLVIEW
        .onAppear {
            onCreate()
        }
    }
    //MARK: - FUNCTION
    func loadMore(){
        numberOfPage += 1
        callApi.searchCurrency(numberOfPage: numberOfPage, sortMode: sortMode, searchText: "") { status in
            statusOfPage = status
        } currencies: { currencies in
            self.currencies += currencies
        }

    }
    func onCreate(){
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
