//
//  File.swift
//  
//
//  Created by Mooseok Bahng on 2023/11/05.
//

import SwiftUI
import CommonUtils

extension TextEditor {
    
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

