//
//  File.swift
//  
//
//  Created by Mooseok Bahng on 2024/01/21.
//

import SwiftUI

public struct PlaceholderAnimation: ViewModifier {

    @State private var contentOpacity = 1.0

    public init() { }
    
    public func body(content: Content) -> some View {
        content
            .opacity(contentOpacity)
            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: contentOpacity)
            .onAppear { contentOpacity = 0.3 }
    }
}
