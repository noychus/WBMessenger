//
//  ContactModel.swift
//  WBMessenger
//
//  Created by NOY on 13.06.2024.
//

import Foundation

struct Contact {
    var id = UUID()
    var name: String
    var isOnline: Bool
    var lastVisit: Date?
    var imageProfile: String?
    var haveStories: Bool
    var phoneNumber: String
}
