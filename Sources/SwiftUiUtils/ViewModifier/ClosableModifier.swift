//
//  ClosableModifier.swift
//  gourmet
//
//  Created by 方 茂碩（Mooseok Bahng） on 2024/06/17.
//

import SwiftUI

public struct ClosableModifier: ViewModifier {
    
    @Environment(\.dismiss) private var dismiss
    private let isClosable: Bool
    
    public init(isClosable: Bool) {
        self.isClosable = isClosable
    }
    
    public func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    isClosable ? closeButton : nil
                }
            }
    }
}

extension ClosableModifier {
    
    private var closeButton: some View {
        Button(action: {
            dismiss()
        }) {
            Image(systemName: "xmark")
        }
    }
}
