//
//  File.swift
//  
//
//  Created by Mooseok Bahng on 2023/06/25.
//

import SwiftUI

extension View {
    @ViewBuilder public func isHidden(_ isHidden: Bool) -> some View {
        if isHidden {
            self.hidden()
        } else {
            self
        }
    }
}
