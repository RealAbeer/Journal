//
//  AppRootView.swift
//  Journal
//
//  Created by Abeer Alshabrami on 10/28/25.
//

import SwiftUI

struct AppRootView: View {
    @State private var showSplash = true

    var body: some View {
        Group {
            if showSplash {
                SplashScreen()
                    .transition(.opacity)
            } else {
                JournalAppView()
                    .transition(.opacity)
            }
        }
        .onAppear {
          
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation(.easeInOut(duration: 0.35)) {
                    showSplash = false
                }
            }
        }
    }
}

#Preview {
    AppRootView()
}
