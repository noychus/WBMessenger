//
//  WalkthroughView.swift
//  WBMessenger
//
//  Created by NOY on 13.06.2024.
//

import SwiftUI

struct WalkthroughView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            VStack {
                
                Image(colorScheme == .light ? "IllustrationLight" : "IllustrationDark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(.horizontal, 62)
                    .padding(.top, 135)
                
                Text("Общайтесь с друзьями и близкими легко")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color("brandTextColor"))
                
                Spacer()
                
            }
            
            LoginButtonView()
        }
        .background(Color("brandBackground"))
    }
}

#Preview {
    WalkthroughView()
}
