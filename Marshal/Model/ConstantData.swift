//
//  ConstantData.swift
//  Marshal
//
//  Created by Blur on 10/15/1400 AP.
//

import Foundation
import SwiftUI
struct ConstantData {
    
    // pertian number -> english number
    func persianNumberToEnglish(text: String) -> String {
        var english : String = ""
        let p1 = text.replacingOccurrences(of: "۱", with: "1")
        let p2 = p1.replacingOccurrences(of: "۲", with: "2")
        let p3 = p2.replacingOccurrences(of: "۳", with: "3")
        let p4 = p3.replacingOccurrences(of: "۴", with: "4")
        let p5 = p4.replacingOccurrences(of: "۵", with: "5")
        let p6 = p5.replacingOccurrences(of: "۶", with: "6")
        let p7 = p6.replacingOccurrences(of: "۷", with: "7")
        let p8 = p7.replacingOccurrences(of: "۸", with: "8")
        let p9 = p8.replacingOccurrences(of: "۹", with: "9")
        english = p9.replacingOccurrences(of: "۰", with: "0")
        return english
    }
    
    // string -> urlImage
    func stringToURLForImage(url: String) -> (URL) {
        let Url = CallApi().baceUrlDownload + url
       return stringToURL(url: Url)
    }
    // string -> Url
    func stringToURL(url: String) -> (URL) {
        let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let urll = URL(string: encodedUrl!)
        return urll!
    }
    //String -> price decimal
    func decimalFormat(text: String) -> String {
        let digit : Double = Double(text) ?? 0
        let formatter = NumberFormatter(numberStyle: .decimal, locale: "fr_FR".toLocale)
        formatter.set(numberStyle: .decimal, groupingSeparator: " ", decimalSeparator: ".")
        var s : String = String(digit.format(formatter: formatter)!)
        s = s.replacingOccurrences(of: " ", with: ",")
        return s == "0" ? text : s
    }
    //homepage -> title
    func homePageTitle(page : HomePages) -> String {
        switch page{
        case .Exchange:
            return "صرافی"
        case .History:
            return "تاریخچه"
        case .Walet:
            return "کیف پول"
        case .Profile:
            return "حساب کاربری"
        case .Invest:
            return "سرمایه گذاری"
        }
        
    }
    //wallet page -> title
    func walletPageTitle(page : WalletPages) -> String {
        switch page{
        case .wallet:
            return "صرافی"
        case .withdraw:
            return "برداشت از حساب"
        case .deposit:
            return "واریز  به  حساب"
        case .transfer:
            return "انتقال ارز"
        }
        
    }
}

