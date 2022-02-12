//
//  Information.swift
//  Marshal
//
//  Created by Blur on 10/6/1400 AP.
//

import Foundation
class Information{
    var _id = ""
    var nationalCode : String = ""
    var birthDate : String = ""
    var jab  = (fa: "" ,en: "")
    var residencePostalCode : Int = 0
    var residenceTelephone : String = ""
    var alternativeMobile : String = ""
    var street  = (fa: "" ,en: "")
    var city  = (fa: "" ,en: "")
    var state  = (fa: "" ,en: "")
    var residenceAddress  = (fa: "" ,en: "")
    var userLevel : UserLevelModel = UserLevelModel()
    var profileImage : String = ""
    var identificationCardImage : String = ""
    var workPlaceAddress  = (fa: "" ,en: "")
    var workPlaceTelephone : String = ""
    var educationStatus : String = ""
    var fieldOfStudy = (fa: "" ,en: "")
    var degreeOfEducationImage : String = ""
    var universityName = (fa: "" ,en: "")
}
