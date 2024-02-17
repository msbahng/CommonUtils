//
//  Overlay.swift
//
//
//  Created by 方 茂碩（Mooseok Bahng） on 2024/02/05.
//

import SwiftUI

public struct Overlay<T: View>: ViewModifier {
        
    @Binding var isShown: Bool
    let overlayView: T
        
    public init(
        isShown: Binding<Bool>,
        overlayView: T
    ) {
        _isShown = isShown
        self.overlayView = overlayView
    }
    
    public func body(content: Content) -> some View {
        ZStack {
            content
            if isShown {
                overlayView
            }
        }
    }
}
