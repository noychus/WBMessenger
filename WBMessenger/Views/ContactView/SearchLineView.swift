//
//  SearchLineView.swift
//  WBMessenger
//
//  Created by NOY on 17.06.2024.
//

import SwiftUI

struct SearchLineView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .padding(.leading)
                .foregroundStyle(Color("brandGrayColor"))
            
            TextField("Search", text: $searchText)
                .font(.system(size: 14, weight: .semibold, design: .default))
                .foregroundStyle(Color("brandGrayColor"))
            
        }
        .frame(height: 36)
        .background(Color("profileIconColor"))
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .padding()
    }
}

#Preview {
    SearchLineView(searchText: .constant(""))
}
