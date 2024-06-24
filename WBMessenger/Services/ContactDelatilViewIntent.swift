//
//  ContactDelatilViewIntent.swift
//  WBMessenger
//
//  Created by NOY on 24.06.2024.
//

import SwiftUI
import AppIntents

struct OpenChatIntent: AppIntent {
    static var title: LocalizedStringResource = "Open Contact"
    static var description = IntentDescription("Opens a contact")

    @Parameter(title: "Contact Name")
    var contactName: String

    func perform() async throws -> some IntentResult {
        if let url = URL(string: "mymessenger://contacts") {
            if await UIApplication.shared.canOpenURL(url) {
                await UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        return .result()
    }
}
