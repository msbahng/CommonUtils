//
//  File.swift
//  
//
//  Created by Mooseok Bahng on 2023/11/05.
//

import SwiftUI

//struct TextEditorModifier: ViewModifier {
//    public func body(content: Content) -> some View {
//        content
//            .foregroundColor(Color.gray)
//            .frame(minHeight: 100)
//            .overlay(
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(MS.Colors.Shared.extraLightGray, lineWidth: 2)
//            )
//            .padding(.leading, MS.Sizes.Layout.sideMargin)
//            .padding(.trailing, MS.Sizes.Layout.sideMargin)
//    }
//}

extension TextEditor {
//    public func normalTextEditor() -> some View {
//        modifier(TextEditorModifier())
//    }
    
    public func textEditorStyle(
        minHeight: CGFloat = 50
    ) -> some View {
        self
            .foregroundColor(Color.gray)
            .frame(minHeight: minHeight)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(MS.Colors.Shared.extraLightGray, lineWidth: 2)
            )
            .padding(.leading, MS.Sizes.Layout.sideMargin)
            .padding(.trailing, MS.Sizes.Layout.sideMargin)
    }
}

