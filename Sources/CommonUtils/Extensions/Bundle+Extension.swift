//
//  File.swift
//  
//
//  Created by 方 茂碩（Mooseok Bahng） on 2024/02/09.
//

import UIKit

extension Bundle {
    public var icon: UIImage? {
        guard let icons = infoDictionary?["CFBundleIcons"] as? [String: Any],
              let primaryIcon = icons["CFBundlePrimaryIcon"] as? [String: Any],
              let iconFiles = primaryIcon["CFBundleIconFiles"] as? [String],
              let iconFileName = iconFiles.last
        else { return nil }
        return UIImage(named: iconFileName)
    }
}
