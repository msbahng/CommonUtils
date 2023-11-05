//
//  File.swift
//  
//
//  Created by Mooseok Bahng on 2023/11/05.
//

import SwiftUI

struct ItemTitleModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .font(.title3)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, MS.Sizes.Layout.sideMargin)
            .padding(.trailing, MS.Sizes.Layout.sideMargin)
    }
}

extension Text {
    public func itemTitle() -> some View {
        modifier(ItemTitleModifier())
    }
}
