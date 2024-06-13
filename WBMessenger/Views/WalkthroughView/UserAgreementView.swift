//
//  UserAgreementView.swift
//  WBMessenger
//
//  Created by NOY on 13.06.2024.
//

import SwiftUI

struct UserAgreementView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Назад") {
            dismiss()
        }
        .foregroundStyle(Color("brandTextColor"))
        .font(.system(size: 16, weight: .semibold, design: .default))
    }
}

#Preview {
    UserAgreementView()
}
