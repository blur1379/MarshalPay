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
        if json["lastChange"].exists(){
            castedCurrency.lastChange = json["lastChange"].int!
        }
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
    
    func convertJsonToWalletCurrency(_ json: JSON)-> WalletCurrency{
        let walletCurrency = WalletCurrency()
        if json.exists(){
            if json["currency"].exists(){
                walletCurrency.currency = convertJsonToCurrency(json["currency"])
            }
            if json["amount"].exists(){
                walletCurrency.amount = json["amount"].int!
            }
        }
        return walletCurrency
    }
    
    func convertJsonToWalletCurrencies(_ json: JSON)-> [WalletCurrency]{
        var walletCurrencies = [WalletCurrency]()
        if json.exists(){
            if json.array!.count > 0 {
                let currenciesJson = json.array!
                for currencyJson in currenciesJson {
                    let newCurency = convertJsonToWalletCurrency(currencyJson)
                    walletCurrencies.append(newCurency)
                }
            }
        }
        return walletCurrencies
    }
    
    func convrtJsonToWallet(_ json: JSON) -> WalletModel{
        let walletModel = WalletModel()
        if json.exists(){
            if json["inventory"].exists(){
                if json["currentCredit"].exists(){
                    walletModel.currentCredit = json["currentCredit"].int!
                }
                if json["validityCredit"].exists(){
                    walletModel.validityCredit = json["validityCredit"].int!
                }
                if json["debtCredit"].exists(){
                    walletModel.debtCredit = json["debtCredit"].int!
                }
            }
            if json["currencies"].exists(){
                walletModel.walletCurencies = convertJsonToWalletCurrencies(json["currencies"])
            }
        }
        return WalletModel()
    }
}
