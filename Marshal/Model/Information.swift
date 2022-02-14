//
//  Information.swift
//  Marshal
//
//  Created by Blur on 10/6/1400 AP.
//

import Foundation
class Information : Identifiable , ObservableObject{
    @Published var _id = ""
    @Published var nationalCode : String = ""
    @Published var birthDate : String = ""
    @Published var jab = Dictionery()
    @Published var residencePostalCode = ""
    @Published var residenceTelephone : String = ""
    @Published var alternativeMobile : String = ""
    @Published var street = Dictionery()
    @Published var city = Dictionery()
    @Published var state = Dictionery()
    @Published var residenceAddress = Dictionery()
    @Published var userLevel : UserLevelModel = UserLevelModel()
    @Published var profileImage : String = ""
    @Published var identificationCardImage : String = ""
    @Published var workPlaceAddress  = Dictionery()
    @Published var workPlaceTelephone : String = ""
    @Published var educationStatus : String = ""
    @Published var fieldOfStudy = Dictionery()
    @Published var degreeOfEducationImage : String = ""
    @Published var universityName = Dictionery()
    @Published var cityCode = ""
    
}
