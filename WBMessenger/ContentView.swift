//
//  ContentView.swift
//  WBMessenger
//
//  Created by NOY on 13.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        
        NavigationStack {
            VStack(spacing: 0) {
                NavigationBar(title: router.navigationTitle(for: router.selectedTab))
                    .background(Color("brandBackground"))
                
                TabView(selection: $router.selectedTab) {
                    
                    ContactsView()
                        .tabItem {
                            Image(router.selectedTab == .contacts ? "contactsTabActive" : "contactsTabNoActive")
                        }
                        .tag(Tabs.contacts)
                    
                    ChatsView()
                        .tabItem {
                            Image(router.selectedTab == .chats ? "chatsTabActive" : "chatsTabNoActive")
                        }
                        .tag(Tabs.chats)
                    
                    MenuView()
                        .tabItem {
                            Image(router.selectedTab == .menu ? "menuTabActive" : "menuTabNoActive")
                        }
                        .tag(Tabs.menu)
                }
                .navigationBarHidden(true)
            }
        }
        .edgesIgnoringSafeArea(.top)
        .onContinueUserActivity("INIntent") { userActivity in
            if let intent = userActivity.interaction?.intent as? OpenChatIntent {
                // Handle OpenChatIntent
                if let contact = DataRouter.shared.contacts.first(where: { $0.name == intent.contactName }) {
                    router.selectedContact = contact
                    router.selectedTab = .contactDetail
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Router())
}
