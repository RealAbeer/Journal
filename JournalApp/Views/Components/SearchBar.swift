//
//  SearchBar.swift
//  Journal
//
//  Created by Abeer Alshabrami on 10/28/25.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        GlassCapsule {
            HStack(spacing: 12) {
               
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 18, weight: .semibold))
                    .opacity(0.85)

                
                TextField("Search", text: $searchText)
                    .foregroundColor(.white)
                    .textInputAutocapitalization(.never)

                
                Image(systemName: "mic.fill")
                    .font(.system(size: 18, weight: .semibold))
                    .opacity(0.9)
            }
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .frame(height: 56)
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 28)
    }
}
