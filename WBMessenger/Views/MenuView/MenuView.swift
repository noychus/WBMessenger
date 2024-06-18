//
//  MenuView.swift
//  WBMessenger
//
//  Created by NOY on 18.06.2024.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        ZStack {
            VStack {
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    Text("Menu View")
                    
                    Spacer()
                }
                
                Spacer()
            }
        }
        .background(Color("brandBackground"))
    }
}

#Preview {
    MenuView()
}
