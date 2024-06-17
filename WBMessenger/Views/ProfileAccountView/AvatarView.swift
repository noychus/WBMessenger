//
//  AvatarView.swift
//  WBMessenger
//
//  Created by NOY on 13.06.2024.
//

import SwiftUI

struct AvatarView: View {
    
    @State var image: String?
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                switch image {
                case .some(let image):
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .frame(width: geometry.size.width,height: geometry.size.height / 3)
                        .position(x: geometry.size.width / 2, y: geometry.size.width / 2)
                        .shadow(radius: 5)
                default:
                    Circle()
                        .foregroundStyle(Color("profileIconColor"))
                        .frame(width: geometry.size.width / 1.7)
                        .position(x: geometry.size.width / 2, y: geometry.size.width / 2)
                        .overlay(
                            Image("personIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width / 3)
                                .position(x: geometry.size.width / 2, y: geometry.size.width / 2)
                        )
                }
            }
        }
    }
}

#Preview {
    ProfileAccountView(contact: Contact(name: "Анастасия Иванова", lastVisitDate: Date().addingTimeInterval(-60), imageProfile: "anastasia", haveStories: false, phoneNumber: "9999999999"))
}

#Preview {
    ProfileAccountView(contact: Contact(name: "Анастасия Иванова", lastVisitDate: Date().addingTimeInterval(-60), imageProfile: nil, haveStories: false, phoneNumber: "9999999999"))
}
