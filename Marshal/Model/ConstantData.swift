//
//  ConstantData.swift
//  Marshal
//
//  Created by Blur on 10/15/1400 AP.
//

import Foundation
struct ConstantData {
    func stringToURLForImage(url: String) -> (URL) {
        let Url = CallApi().baceUrlDownload + url
       return stringToURL(url: Url)
    }
    func stringToURL(url: String) -> (URL) {
        let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let urll = URL(string: encodedUrl!)
        return urll!
    }
}

