//
//  DataRouter.swift
//  WBMessenger
//
//  Created by NOY on 24.06.2024.
//

import Foundation
import WidgetKit

class DataRouter {
    static let shared = DataRouter()
    let userDefaults = UserDefaults(suiteName: "group.com.mymessenger")
    
    private init() {}
    
    var contacts: [Contact] = [
        .init(name: "Анастасия Иванова", lastVisitDate: Date().addingTimeInterval(-86400), imageProfile: "anastasia", haveStories: false, phoneNumber: "9999999999"),
        .init(name: "Петя", lastVisitDate: Date().addingTimeInterval(-30), imageProfile: "petya", haveStories: false, phoneNumber: "9851672288"),
        .init(name: "Маман", lastVisitDate: Date().addingTimeInterval(-10800), imageProfile: "maman", haveStories: true, phoneNumber: "9872873777"),
        .init(name: "Арбуз Дыня", lastVisitDate: Date().addingTimeInterval(-45), imageProfile: "watermelon", haveStories: false, phoneNumber: "9652678377"),
        .init(name: "Иван Иванов", lastVisitDate: Date().addingTimeInterval(-10), imageProfile: nil, haveStories: false, phoneNumber: "9861788787"),
        .init(name: "Лиса Алиса", lastVisitDate: Date().addingTimeInterval(-45), imageProfile: nil, haveStories: true, phoneNumber: "9862788626")
    ]
}
