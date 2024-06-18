//
//  ContactsView.swift
//  WBMessenger
//
//  Created by NOY on 13.06.2024.
//

import SwiftUI

struct ContactsView: View {
    
    var contacts: [Contact] = [
         .init(name: "Анастасия Иванова", lastVisitDate: Date().addingTimeInterval(-60), imageProfile: "anastasia", haveStories: false, phoneNumber: "9999999999"),
         .init(name: "Петя", lastVisitDate: Date().addingTimeInterval(-120), imageProfile: "petya", haveStories: false, phoneNumber: "9851672288"),
         .init(name: "Маман", lastVisitDate: Date().addingTimeInterval(-3600), imageProfile: "maman", haveStories: true, phoneNumber: "9872873777"),
         .init(name: "Арбуз Дыня", lastVisitDate: Date().addingTimeInterval(-86400), imageProfile: "watermelon", haveStories: false, phoneNumber: "9652678377"),
         .init(name: "Иван Иванов", lastVisitDate: Date().addingTimeInterval(-172800), imageProfile: nil, haveStories: false, phoneNumber: "9861788787"),
         .init(name: "Лиса Алиса", lastVisitDate: nil, imageProfile: nil, haveStories: true, phoneNumber: "9862788626")
     ]
    
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        SearchLineView(searchText: $searchText)
                        
                        ForEach(contacts) { contact in
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
        }
    }
}

#Preview {
    ContactsView()
}
