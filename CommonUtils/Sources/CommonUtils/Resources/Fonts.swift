//
//  Fonts.swift
//  
//
//  Created by Mooseok Bahng on 2023/08/12.
//

import UIKit
import SwiftUI

public struct MSFont: Sendable {
    var normal: Font
    var big: Font
    
    public func font(_ sizeClass: UserInterfaceSizeClass?) -> Font {
        if sizeClass == .regular {
            return self.big
        }
        
        return self.normal
    }
}

public struct FontResources: Sendable {
    public var Shared: SharedFontResources = SharedFontResources()

    public init() {}
}

public struct SharedFontResources: Sendable {
    
    public var cellTitle: MSFont = MSFont(normal: .system(size: 14), big: .system(size: 16))
    public var title: MSFont = MSFont(normal: .system(size: 16), big: .system(size: 20))
    public var languageButton: MSFont = MSFont(normal: .system(size: 12), big: .system(size: 14))
    
    public init() {}
}

public extension FontResources {

    
}

