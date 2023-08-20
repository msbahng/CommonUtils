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

