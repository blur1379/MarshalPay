//
//  HistoryModel.swift
//  Marshal
//
//  Created by mohammad blor on 3/12/22.
//

import Foundation
import SwiftUI
class HistoryModel {
    var id = ""
    var name = ""
    var date = ""
    var currencyName = ""
    var toMarshal = false
    var currencyAmount = ""
    var marshalAmount = ""
    func pertianDate() -> String{
        return convertDateToPertian().GregorianToPersian(date: self.date)
        
    }
}
