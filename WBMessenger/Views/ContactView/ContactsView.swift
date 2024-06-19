//
//  ContactsView.swift
//  WBMessenger
//
//  Created by NOY on 13.06.2024.
//

import SwiftUI

struct ContactsView: View {
    
    @EnvironmentObject var router: Router
    
    @State private var searchText = ""
    
    var contacts: [Contact] = [
        .init(name: "Анастасия Иванова", lastVisitDate: Date().addingTimeInterval(-86400), imageProfile: "anastasia", haveStories: false, phoneNumber: "9999999999"),
        .init(name: "Петя", lastVisitDate: Date().addingTimeInterval(-30), imageProfile: "petya", haveStories: false, phoneNumber: "9851672288"),
        .init(name: "Маман", lastVisitDate: Date().addingTimeInterval(-10800), imageProfile: "maman", haveStories: true, phoneNumber: "9872873777"),
        .init(name: "Арбуз Дыня", lastVisitDate: Date().addingTimeInterval(-45), imageProfile: "watermelon", haveStories: false, phoneNumber: "9652678377"),
        .init(name: "Иван Иванов", lastVisitDate: Date().addingTimeInterval(-10), imageProfile: nil, haveStories: false, phoneNumber: "9861788787"),
        .init(name: "Лиса Алиса", lastVisitDate: Date().addingTimeInterval(-1800), imageProfile: nil, haveStories: true, phoneNumber: "9862788626")
    ]
    
    var filteredContacts: [Contact] {
        switch searchText.isEmpty {
        case true:
            return contacts
        case false:
            return contacts.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        SearchLineView(searchText: $searchText)
                        
                        ForEach(filteredContacts) { contact in
                            NavigationLink(destination: ContactDetailView(contact: contact)) {
                                
                                VStack {
                                    ContactRowView(contact: contact)
                                    
                                    Divider()
                                        .padding(.horizontal, 24)
                                        .padding(.top, 8)
                                }
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .background(Color("brandBackground"))
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

#Preview {
    ContactsView()
        .environmentObject(Router())
}
