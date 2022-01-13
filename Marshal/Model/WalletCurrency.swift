//
//  WalletCurrency.swift
//  Marshal
//
//  Created by Moeen Kashisaz on 1/13/22.
//

import Foundation
class WalletCurrency {
    var currency = Currency()
    var amount = 0
    func getAmount()->String {
        if amount != 0 {
            let duration = String(format: "%.01f", amount)
            return duration
        }else {
            return "0"
        }
    }
}
