//
//  File.swift
//  
//
//  Created by Mooseok Bahng on 2023/11/05.
//

import SwiftUI

public struct PrimaryButtonStyle: ButtonStyle {
    
    public init() {
        
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.body)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .padding(.vertical, 8)
            .foregroundColor(
                configuration.isPressed
                ? Color.blue.opacity(0.3)
                : Color.blue
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(
                        configuration.isPressed
                        ? Color.blue.opacity(0.3)
                        : Color.blue,
                        lineWidth: 1.5
                    )
            )
    }
}
