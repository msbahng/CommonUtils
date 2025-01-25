//
//  Version.swift
//  gourmet
//
//  Created by 方 茂碩（Mooseok Bahng） on 2024/02/08.
//

import Foundation

public struct Version {
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
}

extension Version: Comparable {
    static func splitByDot(_ versionNumber: String) -> [Int] {
        versionNumber.split(separator: ".").map { Int($0) ?? 0 }
    }

    static func filled(_ target: [Int], count: Int) -> [Int] {
        (0..<count).map { ($0 < target.count) ? target[$0] : 0 }
    }

    static func compare(lhs: Version, rhs: Version) -> ComparisonResult {
        var left = splitByDot(lhs.rawValue)
        var right = splitByDot(rhs.rawValue)

        let count = max(left.count, right.count)
        left = filled(left, count: count)
        right = filled(right, count: count)

        for index in 0..<count {
            let lhsComponent = left[index]
            let rhsComponent = right[index]

            if lhsComponent < rhsComponent {
                return .orderedDescending
            }
            if lhsComponent > rhsComponent {
                return .orderedAscending
            }
        }
        return .orderedSame
    }

    public static func == (lhs: Version, rhs: Version) -> Bool {
        return compare(lhs: lhs, rhs: rhs) == .orderedSame
    }

    public static func < (lhs: Version, rhs: Version) -> Bool {
        return compare(lhs: lhs, rhs: rhs) == .orderedDescending
    }
}
