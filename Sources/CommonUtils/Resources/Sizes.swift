//
//  Sizes.swift
//  
//
//  Created by Mooseok Bahng on 2023/06/24.
//

import UIKit
import SwiftUI


public struct SizeResources {
    public var Font: FontSizeResource.Type = FontSizeResource.self /* static apple sizes */
    public var Layout: LayoutResource.Type = LayoutResource.self
    public init() {}
}

public struct FontSizeResource {
    public static var largeTitle: Font = .system(size: 14)
    public static var smallTitle: Font = .system(size: 12)
}

public struct LayoutResource {
    public static var sideMargin: CGFloat = 20
    public static var verticalSpacing: CGFloat = 20
    public static var horizontalSpacing: CGFloat = 20
}

