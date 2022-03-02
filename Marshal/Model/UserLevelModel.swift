//
//  UserLevelModel.swift
//  Marshal
//
//  Created by Moeen Kashisaz on 1/16/22.
//

import Foundation
class UserLevelModel : Identifiable, ObservableObject{
    var _id = ""
    var name = ""
    var label = ""
    var description = ""
    var credit = 0
    var registerLevels = UserLevelPages()
    var status = ""
    
    func getbackForUserCart()->String{
        if name == "gold"{
            return "gold_cart"
        }else if name == "silver"{
            return "silver-cart"
        }else if name == "diamond"{
            return "perple_cart"
        }else{
            return "default_cart"
        }
    }
    func getbackForTitle()->String{
        if name == "gold"{
            return "gold_cart_title"
        }else if name == "silver"{
            return "silver_cart_title"
        }else if name == "diamond"{
            return "perple_back_title"
        }else{
            return ""
        }
    }
    
    
}
