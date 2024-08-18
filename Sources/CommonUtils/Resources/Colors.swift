//
//  Colors.swift
//  
//
//  Created by Mooseok Bahng on 2023/06/24.
//

import UIKit
import SwiftUI

private struct Palette: Sendable {
    static let extraLightGray: UIColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
    static let lightGray: UIColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
    static let gray: UIColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
    static let darkGray: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    static let darkerGray: UIColor = #colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.1568627451, alpha: 1)
    static let textBlack: UIColor = #colorLiteral(red: 0.1058823529, green: 0.1058823529, blue: 0.1058823529, alpha: 1)
    static let shadowColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1671188546)
    static let clear: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
    static let white: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    static let eightyPercentWhite: UIColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.8)
    static let themeColor: UIColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    static let supplementaryColor: UIColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
    static let accentColor: UIColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    static let teal: UIColor = #colorLiteral(red: 0.2156862745, green: 0.5254901961, blue: 0.5803921569, alpha: 1)
    
    static let orange: UIColor = #colorLiteral(red: 0.9294117647, green: 0.4156862745, blue: 0.07058823529, alpha: 1)
    static let blue: UIColor = #colorLiteral(red: 0.1058823529, green: 0.5960784314, blue: 0.8862745098, alpha: 1)
    static let red: UIColor = #colorLiteral(red: 1, green: 0, blue: 0.1843137255, alpha: 1)
    static let darkRed: UIColor = #colorLiteral(red: 0.9607843137, green: 0.1333333333, blue: 0.1333333333, alpha: 1)
    static let interBlue: UIColor = #colorLiteral(red: 0, green: 0.6352941176, blue: 1, alpha: 1)
    static let green: UIColor = #colorLiteral(red: 0.01568627451, green: 0.6196078431, blue: 0.003921568627, alpha: 1)
    static let businessGray: UIColor = #colorLiteral(red: 0.5882352941, green: 0.5882352941, blue: 0.5882352941, alpha: 1)
    static let grammarBlue: UIColor = #colorLiteral(red: 0.1294117647, green: 0.3098039216, blue: 0.5137254902, alpha: 1)
    
    static let lightBlue: UIColor = #colorLiteral(red: 0.831372549, green: 0.8745098039, blue: 0.9058823529, alpha: 1)
    static let transparentLightBlue: UIColor = #colorLiteral(red: 0.831372549, green: 0.8745098039, blue: 0.9058823529, alpha: 0.252541738)
}

public struct ColorResources: Sendable {
    public var Shared: GeneralColorResources = GeneralColorResources()
    public init() {}
}

public struct GeneralColorResources: Sendable {
    
    public var clearColor: Color = Color(Palette.clear)
    public var placeholderTextColor: Color = Color(Palette.lightGray)
    public var extraLightGray: Color = Color(Palette.extraLightGray)
    
    public init() {}
}
