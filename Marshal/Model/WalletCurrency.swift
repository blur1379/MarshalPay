//
//  WalletCurrency.swift
//  Marshal
//
//  Created by Moeen Kashisaz on 1/13/22.
//

import Foundation
class WalletCurrency :Identifiable {
    var id = UUID()
    var currency = Currency()
    var amount = 0
    func getAmount()->String {
        if amount != 0 {
            let duration = ConstantData().decimalFormat(text: String(amount))
            return duration
        }else {
            return "0"
        }
    }
}
