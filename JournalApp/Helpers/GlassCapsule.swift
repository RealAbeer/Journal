//
//  GlassCapsule.swift
//  Journal
//
//  Created by Abeer Alshabrami on 10/28/25.
//

import SwiftUI

public struct GlassCapsule<Content: View>: View {
    private let content: () -> Content
    private let corner: CGFloat

    public init(corner: CGFloat = 22, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.corner = corner
    }

    public var body: some View {
        content()
            .padding(.horizontal, 14)
            .frame(height: 44)
            .background(.ultraThinMaterial, in: Capsule())
            .overlay(
                Capsule().stroke(Color.white.opacity(0.18), lineWidth: 0.8)
            )
            .shadow(color: .black.opacity(0.35), radius: 10, x: 0, y: 5)
    }
}
