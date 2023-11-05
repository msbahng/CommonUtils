//
//  File.swift
//  
//
//  Created by Mooseok Bahng on 2023/11/05.
//

import SwiftUI

extension Button {
    
    public func fullWidthButtonStyle(
        sideMargin: CGFloat = MS.Sizes.Layout.sideMargin
    ) -> some View {
        self
            .padding(.horizontal, sideMargin)
    }
}
