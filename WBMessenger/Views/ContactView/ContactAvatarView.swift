//
//  AvatarRowView.swift
//  WBMessenger
//
//  Created by NOY on 17.06.2024.
//

import SwiftUI

struct ContactAvatarView: View {
    
    @State var contact: Contact
    
    var body: some View {
        HStack {
            switch contact.imageProfile {
            case .some(let image):
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 56, height: 56, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            case .none:
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 56, height: 56, alignment: .center)
                    .foregroundStyle(Color("brandColor"))
                    .overlay(
                        HStack {
                            Text(contact.getInitials())
                                .foregroundStyle(Color("brandWhiteColor"))
                                .font(.system(size: 14, weight: .semibold, design: .default))
                        }
                    )
            }
        }
    }
}

#Preview {
    ContactAvatarView(contact: Contact(name: "Анастасия Иванова", lastVisitDate: Date().addingTimeInterval(-60), imageProfile: "anastasia", haveStories: false, phoneNumber: "9999999999"))
}

