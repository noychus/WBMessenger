//
//  ContactDetailView.swift
//  WBMessenger
//
//  Created by NOY on 18.06.2024.
//

import SwiftUI

struct ContactDetailView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var contact: Contact
    
    var body: some View {
        ZStack {
            
            AvatarView(image: contact.imageProfile)
            
            VStack {
                Text(contact.name)
                    .font(.system(size: 24, weight: .medium, design: .default))
                    .foregroundStyle(Color("brandTextColor"))
                
                Text("+7\(contact.phoneNumber)")
                    .font(.system(size: 16, weight: .regular, design: .default))
                    .foregroundStyle(Color("brandGrayColor"))
            }
            
            SocialButtonsView()
        }
        .background(Color("brandBackground"))
    }
}

#Preview {
    ContactDetailView(contact: Contact(name: "Анастасия Иванова", lastVisitDate: Date().addingTimeInterval(-60), imageProfile: "anastasia", haveStories: false, phoneNumber: "9999999999"))
}
