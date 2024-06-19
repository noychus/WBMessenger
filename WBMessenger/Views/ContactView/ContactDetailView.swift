//
//  ContactDetailView.swift
//  WBMessenger
//
//  Created by NOY on 18.06.2024.
//

import SwiftUI

struct ContactDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var router: Router
    @State var contact: Contact
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                
                NavigationBar(title: router.navigationTitle(for: .contactDetail), showBackButton: true) {
                    dismiss()
                    router.selectedTab = .contacts
                    router.selectedContact = nil
                }
                .background(Color("brandBackground"))
                
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
            .onAppear {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    router.selectedTab = .contactDetail
                    router.selectedContact = contact
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

#Preview {
    ContactDetailView(contact: Contact(name: "Анастасия Иванова", lastVisitDate: Date().addingTimeInterval(-60), imageProfile: "anastasia", haveStories: false, phoneNumber: "9999999999"))
        .environmentObject(Router())
}
