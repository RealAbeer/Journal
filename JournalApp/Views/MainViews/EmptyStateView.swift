//
//  EmptyStateView.swift
//  Journal
//
//  Created by Abeer Alshabrami on 10/28/25.
//

import SwiftUI

struct EmptyStateView: View {
    @ObservedObject var viewModel: JournalViewModel
    
    
    private let journeyColor = Color(hex: "#7F81FF")

    var body: some View {
        VStack {
            HStack {
                Text("Journal")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack(spacing: 0) {
                    Menu {
                        Button(action: { viewModel.filterType = .date }) {
                            HStack {
                                Text("By Date")
                                if viewModel.filterType == .date { Image(systemName: "checkmark") }
                            }
                        }
                        Button(action: { viewModel.filterType = .bookmarked }) {
                            HStack {
                                Text("Bookmarked")
                                if viewModel.filterType == .bookmarked { Image(systemName: "checkmark") }
                            }
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(width: 50, height: 44)
                    }
                    
                    Rectangle()
                        .fill(Color.white.opacity(0.15))
                        .frame(width: 1, height: 24)
                    
                    Button(action: { viewModel.startNewJournal() }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(width: 50, height: 44)
                    }
                }
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 22).fill(Color.white.opacity(0.1))
                        RoundedRectangle(cornerRadius: 22).fill(
                            LinearGradient(
                                colors: [Color.white.opacity(0.15), Color.white.opacity(0.05)],
                                startPoint: .topLeading, endPoint: .bottomTrailing
                            )
                        )
                        RoundedRectangle(cornerRadius: 22).stroke(Color.white.opacity(0.2), lineWidth: 0.5)
                    }
                )
                .clipShape(Capsule())
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
            }
            .padding(.horizontal)
            .padding(.top, 50)
            
            Spacer()
            
            VStack(spacing: 10) {
                Image("bokudo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 160)
                    .shadow(radius: 5)

                Text("Begin Your Journey")
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(journeyColor) 

                Text("Craft your personal diary, tap the\nplus icon to begin")
                    .font(.system(size: 15))
                    .foregroundColor(.white.opacity(0.72))
                    .multilineTextAlignment(.center)
            }

            Spacer()
            
            SearchBar(searchText: $viewModel.searchText)
                .padding(.horizontal)
                .padding(.bottom, 30)
        }
    }
}
