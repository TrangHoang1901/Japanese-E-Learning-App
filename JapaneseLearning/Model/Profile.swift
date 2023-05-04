//
//  Profile.swift
//  JapaneseLearning
//
//  Created by Helen Hoang on 5/3/23.
//

import Foundation

struct Profile {
    var username: String
    var email: String
    var currentLevel = Level.N5
    var goalDate = Date()
    var prefersNotifications = true
    
    static let `default` = Profile(username: "S_Anesa", email: "S_Anesa123@gmail.com")
    
    enum Level: String, CaseIterable, Identifiable {
        case Alpha = "Apha"
        case N5 = "N5📓"
        case N4 = "N4📙"
        case N3 = "N3📘"
        case N2 = "N2📗"
        case N1 = "N1📕"
        
        var id: String { rawValue }
    }
}
