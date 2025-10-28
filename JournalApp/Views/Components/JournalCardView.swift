//
//  JournalCardView.swift
//  Journal
//
//  Created by Abeer Alshabrami on 10/28/25.
//

import SwiftUI

struct JournalCardView: View {
    let journal: Journal
    @ObservedObject var viewModel: JournalViewModel
    @State private var offset: CGFloat = 0
    @State private var showingDeleteButton = false
    
    
    private let purple = Color(hex: "#D4C8FF")

    var body: some View {
        ZStack(alignment: .trailing) {
            if showingDeleteButton {
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            offset = 0
                            showingDeleteButton = false
                        }
                        viewModel.requestDelete(journal: journal)
                    }) {
                        Image(systemName: "trash.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 18))
                            .frame(width: 50, height: 50)
                            .background(Color.red)
                            .clipShape(Circle())
                    }
                    .padding(.trailing, 16)
                }
            }
            
            HStack(alignment: .top, spacing: 12) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(journal.title)
                        .font(.system(size: 29, weight: .semibold))
                        .foregroundColor(purple) // العنوان بنفسجي

                    Text(journal.date.formatted(date: .numeric, time: .omitted))
                        .font(.system(size: 16))
                        .foregroundColor(.gray)
                        .padding(.bottom ,80)
                
                    Text(journal.content)
                        .font(.system(size: 19))
                        .foregroundColor(.white)
                        .lineLimit(3)
                        .padding(.top, -80)
                }
                
                Spacer()
                
                Button(action: { viewModel.toggleBookmark(for: journal) }) {
                    Image(systemName: journal.isBookmarked ? "bookmark.fill" : "bookmark")
                        .foregroundColor(purple) 
                        .font(.system(size: 20))
                }
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 200)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 16).fill(Color.white.opacity(0.06))
                    RoundedRectangle(cornerRadius: 16).fill(
                        LinearGradient(
                            colors: [Color.white.opacity(0.1), Color.white.opacity(0.03)],
                            startPoint: .topLeading, endPoint: .bottomTrailing
                        )
                    )
                    RoundedRectangle(cornerRadius: 16).stroke(Color.white.opacity(0.12), lineWidth: 0.5)
                }
            )
            .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
            .cornerRadius(16)
            .offset(x: offset)
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        if gesture.translation.width < 0 {
                            offset = max(gesture.translation.width, -80)
                        } else if showingDeleteButton {
                            offset = gesture.translation.width - 80
                        }
                    }
                    .onEnded { gesture in
                        if gesture.translation.width < -50 {
                            withAnimation(.spring()) {
                                offset = -80
                                showingDeleteButton = true
                            }
                        } else {
                            withAnimation(.spring()) {
                                offset = 0
                                showingDeleteButton = false
                            }
                        }
                    }
            )
        }
    }
}
