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
        formatter.set(numberStyle: .decimal, groupingSeparator: " ", decimalSeparator: "/")
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

class convertDateToPertian{
    var jY : Int = 0
    var jM : Int = 0
    var jD : Int = 0
    var gY : Int = 0
    var gM : Int = 0
    var gD : Int = 0
    var march : Int = 0
    var leap : Int = 0
    
   func JG2JD( year : Int, month : Int , day : Int , J1G0 : Int) -> Int {
          var jd : Int =  (1461 * (year + 4800 + (month - 14) / 12)) / 4
           + (367 * (month - 2 - 12 * ((month - 14) / 12))) / 12
           - (3 * ((year + 4900 + (month - 14) / 12) / 100)) / 4 + day
           - 32075
          if J1G0 == 0 {
               jd = jd - (year + 100100 + (month - 8) / 6) / 100 * 3 / 4 + 752;
          }
          return jd
      }
       
    func JD2JG(JD : Int , J1G0 : Int)  {
          var i : Int
          var j : Int
          j = 4 * JD + 139361631
          
          if J1G0 == 0 {
              j = j + (4 * JD + 183187720) / 146097 * 3 / 4 * 4 - 3908
          }
          i = (j % 1461) / 4 * 5 + 308
          gD = (i % 153) / 5 + 1
          gM = ((i / 153) % 12) + 1
          gY = j / 1461 - 100100 + (8 - gM) / 6
      }
       
    func JalCal(jY : Int) {
          march = 0
          leap = 0
          
          let breaks :[Int] = [-61, 9, 38, 199, 426, 686, 756, 818, 1111, 1181, 1210,
                               1635, 2060, 2097, 2192, 2262, 2324, 2394, 2456, 3178]
          gY = jY + 621
          var leapJ : Int = -14
          var jp = breaks[0]
          var jump : Int = 0
          
          for j in 1...19 {
              let jm :Int = breaks[j]
              jump = jm - jp
              if jY < jm {
                  var N = jY - jp
                  leapJ = leapJ + N / 33 * 8 + (N % 33 + 3) / 4
                  if (jump % 33) == 4 && (jump - N) == 4{
                      leapJ = leapJ + 1
                  }
                  let leapG : Int = (gY / 4) - (gY / 100 + 1) * 3 / 4 - 150
                  march = 20 + leapJ - leapG
                  if (jump - N) < 6 {
                      N = N - jump + (jump + 4) / 33 * 33
                  }
                  leap = ((((N + 1) % 33) - 1) % 4)
                  
                  if leap == -1 {
                      leap = 4
                  }
                  break
              }
              leapJ = leapJ + jump / 33 * 8 + (jump % 33) / 4
              jp = jm
              
          }
      }
       
    func JD2Jal(JDN : Int) {
          JD2JG(JD: JDN, J1G0: 0)
          
          jY =  gY - 621
          JalCal(jY: jY)
          
          let JDN1F = JG2JD(year: gY, month: 3, day: march, J1G0: 0)
          var k : Int = JDN - JDN1F
          if k >= 0 {
              if k <= 185 {
                  jM = 1 + (k / 31)
                  jD = (k % 31) + 1
                  return
              }else {
                  k = k - 186
              }
          }else{
              jY = jY - 1
                  k = k + 179
              if leap == 1{
                  k = k + 1
              }
          }
          jM = 7 + k / 30
          jD = (k % 30) + 1
      }
       
    func GregorianToPersian(date : String) -> String {
           if date.count >= 4{
               if date != "" && date != "---" {
                   let year = Int(date.prefix(4))!
                   let t1 = date.suffix(19)
                   let month = Int(t1.prefix(2))!
                   let t2 = date.suffix(16)
                   let day = Int(t2.prefix(2))!
                   let jd = JG2JD(year: year, month: month, day: day, J1G0: 0)
                   JD2Jal(JDN: jd)
                   return String(jY) + "/" + String(jM) + "/" + String(jD)
               }else {
                   return "---"
               }
           }else{
               return date
           }
          
      }
}
