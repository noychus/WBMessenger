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

final class AppState: ObservableObject {
    @Published var selectedChatID: String?
    @Published var isWalkthroughCompleted: Bool = false {
        didSet {
            UserDefaults(suiteName: "group.com.mymessenger")?.set(isWalkthroughCompleted, forKey: "isWalkthroughCompleted")
        }
    }
    
    private var router: Router
    
    init(router: Router) {
        self.router = router
        self.isWalkthroughCompleted = UserDefaults(suiteName: "group.com.mymessenger")?.bool(forKey: "isWalkthroughCompleted") ?? false
    }
    
    func setRouter(_ router: Router) {
        self.router = router
    }
    
    func handle(url: URL) {
        print("Handling URL: \(url)")
        guard url.scheme == "mymessenger" else {
            print("Invalid URL scheme")
            return
        }
        if url.host == "contacts" {
            print("router Contact \(String(describing: router.selectedTab))")
            router.selectedTab = .contacts
            print("router contacts \(String(describing: router.selectedTab))")
            
        } else if url.host == "contacts", let id = url.pathComponents.last {
            selectedChatID = id
        } else {
            print("Invalid URL host")
        }
    }
}
