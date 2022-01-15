//
//  WalletModel.swift
//  Marshal
//
//  Created by Moeen Kashisaz on 1/13/22.
//

import Foundation
class WalletModel {
    var currentCredit : Int = 0
    var validityCredit = 0
    var debtCredit = 0
    var walletCurencies = [WalletCurrency]()
    func getCurrentCredit()->String {
        if currentCredit != 0 {
            let duration = String(format: "%.01f", currentCredit)
            return duration
        }else {
            return "0"
        }
    }
    func getValidityCredit()->String {
        if validityCredit != 0 {
            let duration = String(format: "%.01f", validityCredit)
            return duration
        }else {
            return "0"
        }
    }
    func getDebtCredit()->String {
        if debtCredit != 0 {
            let duration = String(format: "%.01f", debtCredit)
            return duration
        }else {
            return "0"
        }
    }
}
