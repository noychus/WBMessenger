//
//  WBMessengerApp.swift
//  WBMessenger
//
//  Created by NOY on 13.06.2024.
//

import SwiftUI

@main
struct WBMessengerApp: App {
    
    
    @StateObject private var appState = AppState(router: Router())
    @Environment(\.scenePhase) private var scenePhase
    @StateObject private var router: Router = .init()
    
    init() {
        let router = Router()
        _router = StateObject(wrappedValue: router)
        _appState = StateObject(wrappedValue: AppState(router: router))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(Router())
                .onOpenURL { url in
                    appState.handle(url: url)
                }
        }
    }
}
