//
//  RouterTabs.swift
//  WBMessenger
//
//  Created by NOY on 18.06.2024.
//

import Foundation



enum Tabs: Hashable {
    case contacts
    case chats
    case menu
    case contactDetail
}

final class Router: ObservableObject {
    @Published var selectedTab: Tabs = .chats
    @Published var selectedContact: Contact? = nil {
        didSet {
            objectWillChange.send()
        }
    }
    
    func navigationTitle(for tab: Tabs) -> String {
        switch tab {
        case .contacts:
            return "Контакты"
        case .chats:
            return "Чаты"
        case .menu:
            return "Еще"
        case .contactDetail:
            return selectedContact?.name ?? ""
        }
    }
}
