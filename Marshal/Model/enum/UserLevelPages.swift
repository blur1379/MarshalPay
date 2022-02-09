//
//  UserLevelPages.swift
//  Marshal
//
//  Created by Moeen Kashisaz on 1/16/22.
//

import Foundation
class UserLevelPages : ObservableObject {
    @Published var persianLevel = false
    @Published var englishLevel = false
    @Published var imagesLevel = false
    @Published var educationLevel = false
    @Published var jobLevel = false
    func clearData(){
        persianLevel = false
        englishLevel = false
        imagesLevel = false
        educationLevel = false
        jobLevel = false
    }
}
