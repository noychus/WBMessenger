//
//  AvatarRowView.swift
//  WBMessenger
//
//  Created by NOY on 17.06.2024.
//

import SwiftUI

struct ContactAvatarView: View {
    
    @State var contact: Contact
    var gradientColors = [Color(hex: "#EC9EFF"), Color(hex: "#5F2EEA")]
    
    var body: some View {
        HStack {
            switch contact.haveStories {
            case true:
                RoundedRectangle(cornerRadius: 18)
                    .stroke(LinearGradient(colors: gradientColors, startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2)
                    .frame(width: 54, height: 54)
                    .overlay(
                        VStack {
                            switch contact.imageProfile {
                            case .some(let image):
                                Image(image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 48, height: 48, alignment: .center)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                            case .none:
                                RoundedRectangle(cornerRadius: 15)
                                    .frame(width: 48, height: 48, alignment: .center)
                                    .foregroundStyle(Color("brandColor"))
                                    .overlay(
                                        Text(contact.getInitials())
                                            .foregroundStyle(Color("brandWhiteColor"))
                                            .font(.system(size: 14, weight: .semibold, design: .default))
                                    )
                            }
                        }
                    )
            case false:
                switch contact.imageProfile {
                case .some(let image):
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 48, height: 48, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                case .none:
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 48, height: 48, alignment: .center)
                        .foregroundStyle(Color("brandColor"))
                        .overlay(
                            Text(contact.getInitials())
                                .foregroundStyle(Color("brandWhiteColor"))
                                .font(.system(size: 14, weight: .semibold, design: .default))
                        )
                }
            }
        }

    }
}

#Preview {
    ContactAvatarView(contact: Contact(name: "Анастасия Иванова", lastVisitDate: Date().addingTimeInterval(-60), imageProfile: "anastasia", haveStories: true, phoneNumber: "9999999999"))
}

