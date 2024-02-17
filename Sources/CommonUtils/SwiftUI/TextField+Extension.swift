//
//  TextField+Extension.swift
//
//
//  Created by 方 茂碩（Mooseok Bahng） on 2023/11/08.
//

import SwiftUI

extension TextField {
    
    public func textFieldStyle() -> some View {
        self
            .foregroundColor(Color.gray)
            .padding(.leading, MS.Sizes.Layout.sideMargin)
            .padding(.trailing, MS.Sizes.Layout.sideMargin)
    }
}
