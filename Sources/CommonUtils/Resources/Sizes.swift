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
    public static var verticalMargin: CGFloat = 5
    public static var sideMargin: CGFloat = 20
    public static var verticalSpacing: CGFloat = 10
    public static var horizontalSpacing: CGFloat = 20
    public static var listCellThumbnailSize = CGSize(width: 60, height: 60)
    public static var mapAnnotationImageSize = CGSize(width: 50, height: 50)
    public static var listCellTitleLines = 2
    public static var listCellDescriptionLines = 2
    public static var listCellTitleLinesSmall = 1
    public static var listCellDescriptionLinesSmall = 2
    public static var listCellVerticalInnterSpacing: CGFloat = 4
    public static var defaultPadding: CGFloat = 10
    public static var smallPadding: CGFloat = 5
}

