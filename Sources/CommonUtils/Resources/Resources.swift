//
//  Resources.swift
//  
//
//  Created by Mooseok Bahng on 2023/06/24.
//

import UIKit

public let MS: Resources = privateDefaultResources

internal let privateDefaultResources = Resources()

public struct Resources: Sendable {

    public var Colors = ColorResources()
    public var Sizes = SizeResources()
    public var Fonts = FontResources()

    public init() {}
}

