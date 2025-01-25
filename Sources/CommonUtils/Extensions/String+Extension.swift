//
//  String+Extension.swift
//  HowToSpeak
//
//  Created by Mooseok Bahng on 2020/06/13.
//  Copyright © 2020 MES. All rights reserved.
//

import Foundation

/*
 MARK: - Localization Support
 */
public protocol Localizable {
//    func localized(with pattern: CVarArg...) -> String
    var localized: String { get }
}

extension String: Localizable {
    
    public var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

extension String {
    func index(at position: Int, from start: Index? = nil) -> Index? {
        let startingIndex = start ?? startIndex
        return index(startingIndex, offsetBy: position, limitedBy: endIndex)
    }
    
    public func character(at position: Int) -> Character? {
        guard position >= 0, let indexPosition = index(at: position) else {
            return nil
        }
        return self[indexPosition]
    }
}
