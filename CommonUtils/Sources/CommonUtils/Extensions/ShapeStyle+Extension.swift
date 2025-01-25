//
//  File.swift
//  
//
//  Created by 方 茂碩（Mooseok Bahng） on 2023/10/31.
//

import SwiftUI

public extension ShapeStyle where Self == Color {
    static var debug: Color {
    #if DEBUG
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    #else
        return Color(.clear)
    #endif
    }
}
