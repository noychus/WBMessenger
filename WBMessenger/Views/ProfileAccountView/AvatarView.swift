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
                        .frame(width: geometry.size.width,height: geometry.size.height / 1.7)
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
    ProfileAccountView(contact: Contact(name: "Анастасия Петрова", isOnline: true, haveStories: true, phoneNumber: "9857778888"))
}

#Preview {
    ProfileAccountView(contact: Contact(name: "Анастасия Петрова", isOnline: true, imageProfile: "ImageProfileTest", haveStories: true, phoneNumber: "985 777-88-88"))
}
