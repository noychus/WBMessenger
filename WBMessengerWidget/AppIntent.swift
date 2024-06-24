//
//  AppIntent.swift
//  WBMessenger
//
//  Created by NOY on 24.06.2024.
//

import Foundation
import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("This is an example widget.")
    
    
}
