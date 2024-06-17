//
//  ContactModel.swift
//  WBMessenger
//
//  Created by NOY on 13.06.2024.
//

import Foundation

struct Contact: Identifiable ,Hashable {
    var id = UUID()
    var name: String
    var lastVisitDate: Date? = nil
    var imageProfile: String?
    var haveStories: Bool
    var phoneNumber: String
    
    var lastVisit: String {
        guard let lastVisitDate = self.lastVisitDate else { return "Offline" }

        let secondsAgo = Int(Date().timeIntervalSince(lastVisitDate))

        switch secondsAgo {
        case 0 ..< 60:
            return "Online"
        case 60 ..< 300:
            return "Last seen recently"
        case 300 ..< 3600:
            return "Last seen \(secondsAgo / 60) minutes ago"
        case 3600 ..< 86400:
            return "Last seen \(secondsAgo / 3600) hours ago"
        case 86400 ..< 172800:
            return "Last seen yesterday"
        default:
            return "Last seen \(lastVisitDate.formatted(.dateTime.year(.twoDigits).month(.twoDigits).day()))"
        }
    }
    
    var isOnline: Bool {
        guard let lastVisitDate = lastVisitDate else { return false }
        return Date().timeIntervalSince(lastVisitDate) < 30
    }
    
    func getInitials() -> String {
        let components = name.components(separatedBy: " ")
        let firstNameInitial = components.first?.first?.uppercased() ?? ""
        let lastNameInitial = components.count > 1 ? components[1].first?.uppercased() ?? "" : ""
        return firstNameInitial + lastNameInitial
    }
}


