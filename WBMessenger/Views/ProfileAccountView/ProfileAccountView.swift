//
//  ProfileAccountView.swift
//  WBMessenger
//
//  Created by NOY on 13.06.2024.
//

import SwiftUI

struct ProfileAccountView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var contact: Contact
    
    var body: some View {
        ZStack {
            
            AvatarView(image: contact.imageProfile)
            
            VStack {
                Text(contact.name)
                    .font(.system(size: 24, weight: .medium, design: .default))
                    .foregroundStyle(Color("brandTextColor"))
                
                Text("+7 \(contact.phoneNumber)")
                    .font(.system(size: 16, weight: .regular, design: .default))
                    .foregroundStyle(Color.gray)
            }
            
            SocialButtonsView()
        }
        .background(Color("brandBackground"))
    }
}

#Preview {
    ProfileAccountView(contact: Contact(name: "Анастасия Иванова", isOnline: true, haveStories: true, phoneNumber: "985 777-88-88"))
}

#Preview {
    ProfileAccountView(contact: Contact(name: "Анастасия Петрова", isOnline: true, imageProfile: "ImageProfileTest", haveStories: true, phoneNumber: "985 777-88-88"))
}
