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
}
