//
//  ShapeStyle+Extension.swift
//  TaksongiOS
//
//  Created by Mooseok Bahng on 2024/12/30.
//

import SwiftUI

extension ShapeStyle where Self == Color {
    public static var random: Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
