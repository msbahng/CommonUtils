//
//  CGRect+Extension.swift
//  CommonUtils
//
//  Created by Mooseok Bahng on 2025/04/27.
//

import UIKit

extension CGRect {
    public var flipped: CGRect {
        return CGRect(
            x: origin.x,
            y: 1 - origin.y - height,
            width: width,
            height: height
        )
    }
}
