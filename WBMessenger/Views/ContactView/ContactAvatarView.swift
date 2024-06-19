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
                        ZStack {
                            
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
                            
                            if contact.isOnline {
                                Circle()
                                    .foregroundStyle(Color.green)
                                    .frame(width: 12, height: 12)
                                    .offset(x: 20, y: -20)
                                    .overlay {
                                        Circle()
                                            .stroke(Color.white, lineWidth: 1.5)
                                            .frame(width: 12, height: 12)
                                            .offset(x: 20, y: -20)
                                    }
                            }
                        }
                    )
            case false:
                ZStack {
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
                    
                    if contact.isOnline {
                        Circle()
                            .foregroundStyle(Color.green)
                            .frame(width: 12, height: 12)
                            .offset(x: 20, y: -20)
                            .overlay {
                                Circle()
                                    .stroke(Color.white, lineWidth: 2)
                                    .frame(width: 13, height: 13)
                                    .offset(x: 20, y: -20)
                            }
                    }
                }
            }
        }

    }
}

#Preview {
    ContactAvatarView(contact: Contact(name: "Анастасия Иванова", lastVisitDate: Date().addingTimeInterval(-50), haveStories: false, phoneNumber: "9999999999"))
}

