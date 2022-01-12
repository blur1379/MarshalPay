//
//  Currency.swift
//  Marshal
//
//  Created by Blur on 10/16/1400 AP.
//

import Foundation
class Currency{
    var _id : String = ""
    var name : String = ""
    var key : String = ""
    var marshalKey : String = ""
    var currentValue : Int = 0
    var lastChange : Int = 0
    var minValue : Int = 0
    var maxValue : Int = 0
    var order : Int = 0
    var description : String = ""
    var towardsMarshall : Int = 0
    var wage : Int = 0
    var status : String = ""
    func getpersent () -> String{
        var persent : Float = 0
        persent = (Float(lastChange) / Float(currentValue - lastChange)) * 100
        if lastChange != 0 {
            var duration = String(format: "%.01f", persent)
            duration = duration + " %"
            return duration
        }else {
            return "0 %"
        }
    }
    func getCurrentValue()-> String{
        if currentValue == 0 {
            return "0"
        }else{
            return ConstantData().decimalFormat(text: String(currentValue))
        }
    }
}
