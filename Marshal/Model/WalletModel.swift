//
//  WalletModel.swift
//  Marshal
//
//  Created by Moeen Kashisaz on 1/13/22.
//

import Foundation
class WalletModel : ObservableObject {
    @Published var currentCredit : Double = 0
    @Published var validityCredit : Double = 0
    @Published var debtCredit : Double = 0
    @Published var walletCurencies = [WalletCurrency]()
    func getCurrentCredit()->String {
        if currentCredit != 0 {
            let duration = ConstantData().decimalFormat(text: String(currentCredit))
            return duration
        }else {
            return "0"
        }
    }
    func getValidityCredit()->String {
        if validityCredit != 0 {
            let duration = ConstantData().decimalFormat(text: String( validityCredit))
            return duration
        }else {
            return "0"
        }
    }
    func getDebtCredit()->String {
        if debtCredit != 0 {
            let duration = ConstantData().decimalFormat(text: String(debtCredit))
            return duration
        }else {
            return "0"
        }
    }
}
