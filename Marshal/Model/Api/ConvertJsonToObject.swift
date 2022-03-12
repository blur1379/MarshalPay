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
            castedCurrency.lastChange = json["lastChange"].double!
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
            castedCurrency.currentValue = json["currentValue"].double!
        }
        if json["minValue"].exists(){
            castedCurrency.minValue = json["minValue"].double!
        }
        if json["maxValue"].exists(){
            castedCurrency.maxValue = json["maxValue"].double!
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
                if json["inventory"]["currentCredit"].exists(){
                    walletModel.currentCredit = json["inventory"]["currentCredit"].double!
                }
                if json["inventory"]["validityCredit"].exists(){
                    walletModel.validityCredit = json["inventory"]["validityCredit"].double!
                }
                if json["inventory"]["debtCredit"].exists(){
                    walletModel.debtCredit = json["inventory"]["debtCredit"].double!
                }
            }
            if json["currencies"].exists(){
                walletModel.walletCurencies = convertJsonToWalletCurrencies(json["currencies"])
            }
        }
        return walletModel
    }
    
    func convertJsonToUserLevel (_ json: JSON) -> UserLevelModel{
        let userLevelModel = UserLevelModel()
        if json.exists(){
            if json["registerLevels"].exists(){
                if json["registerLevels"]["persianLevel"].exists(){
                    if json["registerLevels"]["persianLevel"].bool! {
                        userLevelModel.registerLevels.persianLevel = true
                    }
                }
                if json["registerLevels"]["englishLevel"].exists(){
                    if json["registerLevels"]["englishLevel"].bool! {
                        userLevelModel.registerLevels.englishLevel = true
                    }
                }
                if json["registerLevels"]["imagesLevel"].exists(){
                    if json["registerLevels"]["imagesLevel"].bool! {
                        userLevelModel.registerLevels.imagesLevel = true
                    }
                }
                if json["registerLevels"]["educationLevel"].exists(){
                    if json["registerLevels"]["educationLevel"].bool! {
                        userLevelModel.registerLevels.educationLevel = true
                    }
                }
                if json["registerLevels"]["jobLevel"].exists(){
                    if json["registerLevels"]["jobLevel"].bool! {
                        userLevelModel.registerLevels.jobLevel = true
                    }
                }
            }
            if json["_id"].exists(){
                userLevelModel._id = json["_id"].string!
            }
            if json["name"].exists(){
                userLevelModel.name = json["name"].string!
            }
            if json["label"].exists(){
                userLevelModel.label = json["label"].string!
            }
            if json["description"].exists(){
                userLevelModel.description = json["description"].string!
            }
            if json["credit"].exists(){
                userLevelModel.credit = json["credit"].int!
            }
        }
        return userLevelModel
    }
    
    func convertJsonToUserLevels (_ json: JSON) -> [UserLevelModel]{
        var userLevelsModel = [UserLevelModel]()
        if json.exists(){
            if json.array!.count > 0 {
                let userLevelsJson = json.array!
                for userLevelJson in userLevelsJson {
                    let newUserLevel = convertJsonToUserLevel(userLevelJson)
                    userLevelsModel.append(newUserLevel)
                }
            }
        }
        return userLevelsModel
    }
    
    func convertJsonToUser(_ json: JSON) -> User {
        var user = User()
        if json.exists(){
            if json["firstName"].exists(){
                if json["firstName"]["fa"].exists(){
                    user.firstName.fa = json["firstName"]["fa"].string!
                }
                if json["firstName"]["en"].exists(){
                    user.firstName.en = json["firstName"]["en"].string!
                }
            }
            
            if json["lastName"].exists(){
                if json["lastName"]["fa"].exists(){
                    user.lastName.fa = json["lastName"]["fa"].string!
                }
                if json["lastName"]["en"].exists(){
                    user.lastName.en = json["lastName"]["en"].string!
                }
            }
            
            if json["_id"].exists(){
                user._id = json["_id"].string!
            }
            
            if json["mobile"].exists(){
                user.mobile = json["mobile"].string!
            }
            if json["userName"].exists(){
                user.userName = json["userName"].string!
            }
            
            if json["accountNumber"].exists(){
                user.accountNumber = json["accountNumber"].string!
            }
            
            
            if json["information"].exists(){

                if json["information"]["job"].exists(){
                   
                    if json["information"]["job"]["fa"].exists(){
                        user.information.jab.fa = json["information"]["job"]["fa"].string!
                    }
                    
                    if json["information"]["job"]["en"].exists(){
                        user.information.jab.en = json["information"]["job"]["en"].string!
                    }
                    
                }
                
                if json["information"]["state"].exists(){

                    if json["information"]["state"]["fa"].exists(){
                        user.information.state.fa = json["information"]["state"]["fa"].string!
                    }
                    
                    if json["information"]["state"]["en"].exists(){
                        user.information.state.en = json["information"]["state"]["en"].string!
                    }
                    
                }
                
                if json["information"]["city"].exists(){

                    if json["information"]["city"]["fa"].exists(){
                        user.information.city.fa = json["information"]["city"]["fa"].string!
                    }
                    
                    if json["information"]["city"]["en"].exists(){
                        user.information.city.en = json["information"]["city"]["en"].string!
                    }
                    
                }
                
                if json["information"]["street"].exists(){

                    if json["information"]["street"]["fa"].exists(){
                        user.information.street.fa = json["information"]["street"]["fa"].string!
                    }
                    
                    if json["information"]["street"]["en"].exists(){
                        user.information.street.en = json["information"]["street"]["en"].string!
                    }
                    
                }
                
                if json["information"]["residenceAddress"].exists(){

                    if json["information"]["residenceAddress"]["fa"].exists(){
                        user.information.residenceAddress.fa = json["information"]["residenceAddress"]["fa"].string!
                    }
                    
                    if json["information"]["residenceAddress"]["en"].exists(){
                        user.information.residenceAddress.en = json["information"]["residenceAddress"]["en"].string!
                    }
                    
                }
                
                
                if json["information"]["workPlaceAddress"].exists(){

                    if json["information"]["workPlaceAddress"]["fa"].exists(){
                        user.information.workPlaceAddress.fa = json["information"]["workPlaceAddress"]["fa"].string!
                    }
                    
                    if json["information"]["workPlaceAddress"]["en"].exists(){
                        user.information.workPlaceAddress.en = json["information"]["workPlaceAddress"]["en"].string!
                    }
                    
                }
                
                if json["information"]["fieldOfStudy"].exists(){

                    if json["information"]["fieldOfStudy"]["fa"].exists(){
                        user.information.fieldOfStudy.fa = json["information"]["fieldOfStudy"]["fa"].string!
                    }
                    
                    if json["information"]["fieldOfStudy"]["en"].exists(){
                        user.information.fieldOfStudy.en = json["information"]["fieldOfStudy"]["en"].string!
                    }
                    
                }
                
                if json["information"]["universityName"].exists(){

                    if json["information"]["universityName"]["fa"].exists(){
                        user.information.universityName.fa = json["information"]["universityName"]["fa"].string!
                    }
                    
                    if json["information"]["universityName"]["en"].exists(){
                        user.information.universityName.en = json["information"]["universityName"]["en"].string!
                    }
                    
                }
                
                if json["information"]["_id"].exists(){
                    user.information._id = json["information"]["_id"].string!
                }
                
                if json["information"]["birthDate"].exists(){
                    user.information.birthDate = json["information"]["birthDate"].string!
                }
                //FIXME: change this
                
                if json["information"]["nationalCode"].exists(){
                    user.information.nationalCode = json["information"]["nationalCode"].string ?? ""
                }
                
                if json["information"]["residencePostalCode"].exists(){
                    user.information.residencePostalCode = json["information"]["residencePostalCode"].string!
                }
                
                if json["information"]["alternativeMobile"].exists(){
                    user.information.alternativeMobile = json["information"]["alternativeMobile"].string!
                }
                
                if json["information"]["alternativeMobile"].exists(){
                    user.information.alternativeMobile = json["information"]["alternativeMobile"].string!
                }

                if json["information"]["residenceTelephone"].exists(){
                    user.information.residenceTelephone = json["information"]["residenceTelephone"].string!
                }
                
                if json["information"]["workPlaceTelephone"].exists(){
                    user.information.workPlaceTelephone = json["information"]["workPlaceTelephone"].string!
                }
                
                if json["information"]["educationStatus"].exists(){
                    user.information.educationStatus = json["information"]["educationStatus"].string!
                }
                
                if json["information"]["userLevel"].exists(){
                    let userLevels = json["information"]["userLevel"].array!
                    for userLevel in userLevels {
                        if userLevel["status"].exists(){
                            if userLevel["status"].string! == "accepted"{
                                user.information.userLevel = convertJsonToUserLevel(userLevel["level"])
                            }
                            
                        }
                        
                    }

                }
            
            }
            
        }
        
        return user
    }
}
