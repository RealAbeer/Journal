//
//  DeleteAlertView.swift
//  Journal
//
//  Created by Abeer Alshabrami on 10/28/25.
//

import SwiftUI

struct DeleteAlertView: View {
    @ObservedObject var viewModel: JournalViewModel
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                Text("Delete Journal?")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                
                Text("Are you sure you want to delete this journal?")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                HStack(spacing: 12) {
                    Button(action: {
                        viewModel.showDeleteAlert = false
                        viewModel.deleteTarget = nil
                    }) {
                        Text("Cancel")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color(red: 0.12, green: 0.12, blue: 0.12))
                            .cornerRadius(20)
                            .cornerRadius(12)
                    }
                    
                    Button(action: { viewModel.confirmDelete() }) {
                        Text("Delete")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .background(Color.red)
                            .cornerRadius(12)
                    }
                }
            }
            .padding(24)
            .background(Color(red: 0.12, green: 0.12, blue: 0.12))
            .cornerRadius(20)
            .padding(.horizontal, 40)
        }
    }
}
