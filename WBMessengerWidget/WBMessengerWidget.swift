//
//  WBMessengerWidget.swift
//  WBMessengerWidget
//
//  Created by NOY on 24.06.2024.
//

import WidgetKit
import AppIntents
import SwiftUI

struct Provider: AppIntentTimelineProvider {
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), contacts: [], configuration: ConfigurationAppIntent())
    }

    func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> SimpleEntry {
        let contacts = DataRouter.shared.contacts
        let currentDate = Date()
        return SimpleEntry(date: currentDate, contacts: contacts, configuration: configuration)
    }

    func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []

        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let contacts = DataRouter.shared.contacts
            let entry = SimpleEntry(date: entryDate, contacts: contacts, configuration: configuration)
            entries.append(entry)
        }

        return Timeline(entries: entries, policy: .atEnd)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let contacts: [Contact]
    let configuration: ConfigurationAppIntent
}

struct WBMessengerWidgetEntryView : View {
    
    @EnvironmentObject var router: Router
    
    var entry: Provider.Entry
    
    var body: some View {
        VStack() {
            HStack(spacing: 0) {
                Text("Избранные Контакты")
                    .font(.system(size: 14, weight: .semibold, design: .default))
                Spacer()
            }
            
            Spacer()
            
            HStack {
                ForEach(entry.contacts.filter { $0.isOnline }) { contact in
                    Button(action: {
                        router.selectedContact = contact
                        router.selectedTab = .contactDetail
                    }) {
                        Image(contact.imageProfile ?? "maman")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 70, height: 70)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .foregroundStyle(.black)
            .containerBackground(for: .widget) {
                Color("brandWhiteColor")
            }
        }
        .padding(.vertical, 8)
        .widgetURL(URL(string: "mwbmessenger://contacts"))
    }
}

struct WBMessengerWidget: Widget {
    let kind: String = "WBMessengerWidget"
    
    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: ConfigurationAppIntent.self, provider: Provider()) { entry in
            WBMessengerWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }
        .supportedFamilies([.systemMedium])
    }
}

