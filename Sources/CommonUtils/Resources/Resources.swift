//
//  Resources.swift
//  
//
//  Created by Mooseok Bahng on 2023/06/24.
//

import UIKit

public internal(set) var MS: Resources = privateDefaultResources

internal let privateDefaultResources = Resources()

public struct Resources {

    public var Colors = ColorResources()
    public var Sizes = SizeResources()
    public var Fonts = FontResources()

    public init() {}
}

