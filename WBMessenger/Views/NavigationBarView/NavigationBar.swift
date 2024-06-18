//
//  NavigationBar.swift
//  WBMessenger
//
//  Created by NOY on 18.06.2024.
//

import SwiftUI

struct NavigationBar: View {
    
    @EnvironmentObject var router: Router
    
    var title: String
    var showBackButton: Bool = false
    var showPlusButton: Bool {
        return router.selectedTab == .contacts
    }
    var backButtonAction: () -> Void = {}
    
    var body: some View {
        HStack(spacing: 8) {
            if showBackButton {
                Button(action: backButtonAction, label: {
                    Image("backButton")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24, alignment: .center)
                })
            }
            
            Text(router.navigationTitle(for: router.selectedTab))
                .font(.system(size: 18, weight: .semibold, design: .default))
                .foregroundStyle(Color("brandTextColor"))
            
            Spacer()
            
            if showPlusButton {
                Button(action: {}, label: {
                    Image("plusButton")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24, height: 24, alignment: .center)
                })
            }
        }
        .padding(.horizontal)
        .frame(height: 40)
    }
}

#Preview {
    NavigationBar(title: "Chats")
        .environmentObject(Router())
}

#Preview {
    NavigationBar(title: "Chats", showBackButton: true)
        .environmentObject(Router())
}
