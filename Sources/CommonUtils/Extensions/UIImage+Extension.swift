//
//  UIImage+Extension.swift
//  
//
//  Created by Mooseok Bahng on 2023/06/24.
//

import UIKit

extension UIImage {
    public func resize(size _size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(_size, false, 0.0)
        draw(in: CGRect(origin: .zero, size: _size))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
    
    public func resizeToSmall(imageSize: CGFloat) -> UIImage? {
        let maxSize: CGFloat = imageSize / UIScreen.main.scale
        
        guard size.width > maxSize || size.height > maxSize else {
            return self
        }
        
        var newSize: CGSize
        
        if size.width >= size.height {
            newSize = CGSize(width: maxSize, height: size.height * maxSize / size.width)
        } else {
            newSize = CGSize(width: size.width * maxSize / size.height, height: maxSize)
        }
        
        return resize(size: newSize)
    }
}
