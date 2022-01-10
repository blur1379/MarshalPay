//
//  ConvertJsonToObject.swift
//  Marshal
//
//  Created by Blur on 10/16/1400 AP.
//

import Foundation
import SwiftyJSON

struct ConvertJsonToObject {
    func convertJsonToCurrency (_ json :JSON) -> Currency{
        let castedCurrency = Currency()
        if json["_id"].exists(){
            castedCurrency._id = json["_id"].string!
        }
        if json["name"].exists(){
            castedCurrency.name = json["name"].string!
        }
        if json["key"].exists(){
            castedCurrency.key = json["key"].string!
        }
        if json["marshalKey"].exists(){
            castedCurrency.marshalKey = json["marshalKey"].string!
        }
        if json["lastDayValue"].exists(){
            castedCurrency.lastDayValue = json["lastDayValue"].int!
        }
        if json["previousValue"].exists(){
            castedCurrency.previousValue = json["previousValue"].int!
        }
        if json["currentValue"].exists(){
            castedCurrency.currentValue = json["currentValue"].int!
        }
        if json["minValue"].exists(){
            castedCurrency.minValue = json["minValue"].int!
        }
        if json["maxValue"].exists(){
            castedCurrency.maxValue = json["maxValue"].int!
        }
        if json["order"].exists(){
            castedCurrency.order = json["order"].int!
        }
        if json["description"].exists(){
            castedCurrency.description = json["description"].string!
        }
        if json["towardsMarshall"].exists(){
            castedCurrency.towardsMarshall = json["towardsMarshall"].int!
        }
        if json["wage"].exists() {
            castedCurrency.wage = json["wage"].int!
        }
        if json["status"].exists() {
            castedCurrency.status = json["status"].string!
        }
        
        return castedCurrency
    }
    
    func convertJsonToCurrenies(_ json: JSON) -> [Currency]{
        var currenciesApi = [Currency]()
        print("---------------helloooo")
        print(json)
        print("---------------goodby")
        if json.exists(){
            if json.array!.count > 0 {
                let currenciesJson = json.array!
                for currencyJson in currenciesJson {
                    let newCurency =  convertJsonToCurrency(currencyJson)
                    currenciesApi.append(newCurency)
                }
            }
        }

        return currenciesApi
    }
}
