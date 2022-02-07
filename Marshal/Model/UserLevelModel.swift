//
//  UserLevelModel.swift
//  Marshal
//
//  Created by Moeen Kashisaz on 1/16/22.
//

import Foundation
class UserLevelModel : Identifiable, ObservableObject{
    var _id = ""
    var name = ""
    var label = ""
    var description = ""
    var credit = 0
    var registerLevels = UserLevelPages()
    @Published var selected = false
}
