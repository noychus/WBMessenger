//
//  LoginButtonView.swift
//  WBMessenger
//
//  Created by NOY on 13.06.2024.
//

import SwiftUI

struct LoginButtonView: View {
    
    @State private var isPressed = false
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack(spacing: 16) {
                
                UserAgreementButton()
                
                Button(action: {
                    isPressed.toggle()
                }, label: {
                    HStack {
                        Text("Начать общаться")
                            .font(.system(size: 16, weight: .semibold, design: .default))
                            .foregroundStyle(Color("brandWhiteColor"))
                    }
                    .frame(width: geometry.size.width, height: geometry.size.width / 6.2)
                    .background(Color("brandColor"))
                    .clipShape(Capsule())
                })
            }
            .frame(width: geometry.size.width, height: geometry.size.height, alignment: .bottom)
        }
        .padding(.horizontal)
        .fullScreenCover(isPresented: $isPressed) {
            AuthorizationView()
        }
    }
}

#Preview {
    LoginButtonView()
}
