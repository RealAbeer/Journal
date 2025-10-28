//
//  EditorView.swift
//  Journal
//
//  Created by Abeer Alshabrami on 10/28/25.
//

import SwiftUI

struct EditorView: View {
    @ObservedObject var viewModel: JournalViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color(red: 0.11, green: 0.11, blue: 0.12)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                HStack {
                    
                    Button(action: {
                        if !viewModel.currentTitle.isEmpty || !viewModel.currentContent.isEmpty {
                            viewModel.showDiscardAlert = true
                        } else {
                            dismiss()
                            viewModel.isEditing = false
                        }
                    }) {
                        glassCircle(
                            icon: "xmark",
                            iconColor: .white,
                            circleColor: Color.white.opacity(0.08)
                        )
                    }

                    Spacer()
                    
                   
                    Button(action: {
                        viewModel.saveJournal()
                        dismiss()
                    }) {
                        glassCircle(
                            icon: "checkmark",
                            iconColor: .black,
                            circleColor: Color(hex: "#7F81FF")
                        )
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 16)
                .padding(.bottom, 12)
                
               

                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                     
                        TextField("Title", text: $viewModel.currentTitle)
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                        
                        Text(Date().formatted(date: .numeric, time: .omitted))
                            .font(.system(size: 13))
                            .foregroundColor(.gray)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 16)
                        
                       
                        ZStack(alignment: .topLeading) {
                            if viewModel.currentContent.isEmpty {
                                Text("Type your Journal...")
                                    .foregroundColor(Color(red: 0.4, green: 0.4, blue: 0.4))
                                    .font(.system(size: 17))
                                    .padding(.horizontal, 25)
                                    .padding(.top, 8)
                            }
                            
                            TextEditor(text: $viewModel.currentContent)
                                .font(.system(size: 17))
                                .foregroundColor(.white)
                                .scrollContentBackground(.hidden)
                                .background(Color.clear)
                                .padding(.horizontal, 20)
                                .frame(minHeight: 400)
                        }
                    }
                }
            }
            
          
            if viewModel.showDiscardAlert {
                DiscardAlertView(viewModel: viewModel)
            }
        }
        .presentationDetents([.large])
        .presentationDragIndicator(.hidden)
        .presentationCornerRadius(28)
        .interactiveDismissDisabled()
    }
    
  
    private func glassCircle(icon: String, iconColor: Color, circleColor: Color) -> some View {
        Image(systemName: icon)
            .font(.system(size: 20, weight: .semibold))
            .foregroundColor(iconColor)
            .frame(width: 44, height: 44)
            .background(
                ZStack {
                    Circle().fill(circleColor)
                    Circle().fill(
                        LinearGradient(
                            colors: [
                                Color.white.opacity(0.15),
                                Color.white.opacity(0.05)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    Circle().stroke(Color.white.opacity(0.25), lineWidth: 0.6)
                }
            )
            .clipShape(Circle())
            .shadow(color: Color.black.opacity(0.25), radius: 8, x: 0, y: 4)
    }
}
