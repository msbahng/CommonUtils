//
//  File.swift
//  
//
//  Created by Mooseok Bahng on 2023/11/05.
//

import SwiftUI
import CommonUtils

extension Button {
    
    public func fullWidthButtonStyle(
        sideMargin: CGFloat = MS.Sizes.Layout.sideMargin,
        verticalMargin: CGFloat = MS.Sizes.Layout.verticalMargin
    ) -> some View {
        self
            .padding(.horizontal, sideMargin)
            .padding(.vertical, verticalMargin)
    }
}
