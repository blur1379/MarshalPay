//
//  User.swift
//  Marshal
//
//  Created by Blur on 10/6/1400 AP.
//

import Foundation
class User : Identifiable , ObservableObject{
    @Published var _id : String = ""
    @Published var userName : String = ""
    @Published var firstName = Dictionery()
    @Published var lastName = Dictionery()
    @Published var mobile = ""
    @Published var information : Information = Information()
    @Published var accountNumber = ""
    
    @Published var accountNumber1 = "xxxx"
    @Published var accountNumber2 = "xxxx"
    @Published var accountNumber3 = "xxxx"
    @Published var accountNumber4 = "xxxx"
    
    func creatAccount(){
        if accountNumber.count == 16 {
            accountNumber1 = accountNumber.substring(with: 0..<4)
            accountNumber2 = accountNumber.substring(with: 4..<8)
            accountNumber3 = accountNumber.substring(with: 8..<12)
            accountNumber4 = accountNumber.substring(with: 12..<16)
        }
       
    }
}
