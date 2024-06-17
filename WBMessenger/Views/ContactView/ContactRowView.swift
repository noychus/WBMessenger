//
//  ContactRow.swift
//  WBMessenger
//
//  Created by NOY on 17.06.2024.
//

import SwiftUI

struct ContactRowView: View {
    
    @State var contact: Contact
    
    var body: some View {
        HStack(spacing: 16) {
            ContactAvatarView(contact: contact)
            
            VStack(spacing: 8) {
                Text(contact.name)
                    .font(.system(size: 14, weight: .semibold, design: .default))
                    .foregroundStyle(Color("brandTextColor"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(contact.isOnline ? "Online" : "Offline")
                    .font(.system(size: 12, weight: .regular, design: .default))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color("brandGrayColor"))
                
            }
            
            Spacer()
        }
        .background(Color("brandBackground"))
        .padding(.horizontal)
    }
}

#Preview {
    ContactRowView(contact: Contact(name: "Анастасия Иванова", lastVisitDate: Date().addingTimeInterval(-60), imageProfile: "anastasia", haveStories: false, phoneNumber: "9999999999"))
}

