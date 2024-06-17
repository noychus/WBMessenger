//
//  SocialButtonsView.swift
//  WBMessenger
//
//  Created by NOY on 13.06.2024.
//

import SwiftUI

struct SocialButtonsView: View {
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack {
                        Image("twitter")
                    }
                    .frame(width: geometry.size.width / 5, height: geometry.size.width / 10, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color("brandColor"), lineWidth: 1.5)
                    )
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    HStack {
                        Image("instagram")
                    }
                    .frame(width: geometry.size.width / 5, height: geometry.size.width / 10, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color("brandColor"), lineWidth: 1.5)
                    )
                })
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack {
                        Image("linkedIn")
                    }
                    .frame(width: geometry.size.width / 5, height: geometry.size.width / 10, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color("brandColor"), lineWidth: 1.5)
                    )
                })
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    HStack {
                        Image("facebook")
                    }
                    .frame(width: geometry.size.width / 5, height: geometry.size.width / 10, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color("brandColor"), lineWidth: 1.5)
                    )
                })
                
                Spacer()
            }
            .padding()
            .position(x: geometry.size.width / 2, y: geometry.size.height / 1.7)
        }
    }
}

#Preview {
    SocialButtonsView()
}
