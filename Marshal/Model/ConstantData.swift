//
//  ConstantData.swift
//  Marshal
//
//  Created by Blur on 10/15/1400 AP.
//

import Foundation
import SwiftUI
struct ConstantData {
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
    func homePageTitle(page : homePages) -> String {
        switch page{
        case .Exchange:
            return "صرافی"
        case .History:
            return "تاریخچه"
        case .Walet:
            return "کیف پول"
        case .Profile:
            return "حساب کاربری"
        }
        
    }
}

