//
//  View+ProgressView.swift
//  CommonUtils
//
//  Created by Mooseok Bahng on 2025/04/28.
//

import SwiftUI

public struct ProgressViewModifier: ViewModifier {
    @Binding var isShown: Bool

    public func body(content: Content) -> some View {
        content
            .overlay {
                ZStack {
                    Color.black.opacity(0.25)
                        .ignoresSafeArea()
                    ProgressView()
                        .controlSize(.large)
                        .tint(.white)
                }
                .ignoresSafeArea(.all)
                .isHidden(!isShown)
            }
    }
}

extension View {
    public func progress(
        isShown: Binding<Bool>
    ) -> some View {
        modifier(
            ProgressViewModifier(isShown: isShown)
        )
    }
}
