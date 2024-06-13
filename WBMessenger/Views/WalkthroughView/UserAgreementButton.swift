//
//  UserAgreementButton.swift
//  WBMessenger
//
//  Created by NOY on 13.06.2024.
//

import SwiftUI

struct UserAgreementButton: View {
    
    @State private var isPressedUserAgreement = false
    @State private var isPressedTermsOfUse = false
    
    
    var body: some View {
        VStack {
            Text("Нажимая кнопку продолжить я соглашаюсь c")
                .foregroundStyle(Color.gray)
            
            HStack(spacing: 2) {
                Button(action: { isPressedUserAgreement.toggle() }, label: {
                    Text("Политикой Конфиденциальности")
                        .foregroundStyle(Color("brandColor"))
                })
                
                Text("и")
                    .foregroundStyle(Color.gray)
                
                Button(action: { isPressedTermsOfUse.toggle() }, label: {
                    Text("Условиями Использования")
                        .foregroundStyle(Color("brandColor"))
                    
                })
            }
        }
        .font(.system(size: 10, weight: .regular, design: .default))
        .sheet(isPresented: $isPressedUserAgreement, content: {
            UserAgreementView()
        })
        .sheet(isPresented: $isPressedTermsOfUse, content: {
            TermsOfUseView()
        })
    }
}

//Нажимая кнопку продолжить я соглашаюсь с  Политикой Конфиденциальности и Условиями Использования

#Preview {
    UserAgreementButton()
}
