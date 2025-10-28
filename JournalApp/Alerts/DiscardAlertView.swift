//
//  DiscardAlertView.swift
//  Journal
//
//  Created by Abeer Alshabrami on 10/28/25.
//

import SwiftUI

struct DiscardAlertView: View {
    @ObservedObject var viewModel: JournalViewModel
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Color.clear
            .alert("Discard Changes?", isPresented: $viewModel.showDiscardAlert) {
                Button("Keep Editing", role: .cancel) { }
                Button("Discard", role: .destructive) {
                    viewModel.discardChanges()
                    dismiss()
                }
            } message: {
                Text("Are you sure you want to discard changes on this journal?")
            }
    }
}
