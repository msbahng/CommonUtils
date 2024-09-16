//
//  File.swift
//  
//
//  Created by Mooseok Bahng on 2024/01/21.
//

import SwiftUI

extension View {
    @ViewBuilder 
    public func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }

    @ViewBuilder
    public func redacted(showPlaceholder: Bool) -> some View {
        if showPlaceholder {
            self
                .redacted(reason: .placeholder)
                .modifier(PlaceholderAnimation())
        } else {
            self
                .unredacted()
        }
    }
}
