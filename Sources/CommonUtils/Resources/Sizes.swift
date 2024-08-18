//
//  Sizes.swift
//  
//
//  Created by Mooseok Bahng on 2023/06/24.
//

import UIKit
import SwiftUI


public struct SizeResources: Sendable {
    public var Font: FontSizeResource.Type = FontSizeResource.self /* static apple sizes */
    public var Layout: LayoutResource.Type = LayoutResource.self
    public init() {}
}

public struct FontSizeResource: Sendable {
    public static let largeTitle: Font = .system(size: 14)
    public static let smallTitle: Font = .system(size: 12)
}

public struct LayoutResource: Sendable {
    public static let verticalMargin: CGFloat = 5
    public static let sideMargin: CGFloat = 20
    public static let verticalSpacing: CGFloat = 10
    public static let horizontalSpacing: CGFloat = 20
    public static let listCellThumbnailSize = CGSize(width: 60, height: 60)
    public static let mapAnnotationImageSize = CGSize(width: 50, height: 50)
    public static let listCellTitleLines = 2
    public static let listCellDescriptionLines = 2
    public static let listCellTitleLinesSmall = 1
    public static let listCellDescriptionLinesSmall = 1
    public static let listCellVerticalInnterSpacing: CGFloat = 4
    public static let defaultPadding: CGFloat = 10
    public static let smallPadding: CGFloat = 5
}

