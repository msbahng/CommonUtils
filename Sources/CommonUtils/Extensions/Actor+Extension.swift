//
//  Actor+Extension.swift
//  gourmet
//
//  Created by Mooseok Bahng on 2024/08/30.
//

import Foundation

extension Actor {
    func isolated<T: Sendable>(_ closure: @Sendable (isolated Self) -> T) -> T {
        return closure(self)
    }
}
