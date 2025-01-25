//
//  File.swift
//  
//
//  Created by 方 茂碩（Mooseok Bahng） on 2024/05/13.
//

import Foundation

extension Date {

    public static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}
