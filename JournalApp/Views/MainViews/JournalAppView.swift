//
//  JournalAppView.swift
//  Journal
//
//  Created by Abeer Alshabrami on 10/28/25.
//

import SwiftUI

struct JournalAppView: View {
    @StateObject private var viewModel = JournalViewModel()
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            if viewModel.journals.isEmpty {
                EmptyStateView(viewModel: viewModel)
            } else {
                MainPageView(viewModel: viewModel)
            }
            
           
            if viewModel.showDeleteAlert {
                DeleteAlertView(viewModel: viewModel)
            }
        }
        .preferredColorScheme(.dark)
        .sheet(isPresented: $viewModel.isEditing) {
            EditorView(viewModel: viewModel)
            .presentationBackground(Color.clear)       }
    }
}

#Preview {
    JournalAppView()
}
