//
//  File.swift
//  
//
//  Created by Mooseok Bahng on 2023/07/07.
//

import CoreLocation

extension CLPlacemark {
    
    func makeAddressString() -> String {
        
        switch (self.subThoroughfare, self.thoroughfare, self.locality, self.administrativeArea, self.postalCode, self.country) {
        case let (.some(subThoroughfare), .some(thoroughfare), .some(locality), .some(administrativeArea), .some(postalCode), .some(country)):
            
            let pre = Locale.preferredLanguages[0]
            print("language : ", pre)
            
            if pre.starts(with: "ko") || pre.starts(with: "ja") {
                return "\(country) \(administrativeArea) \(locality) \(thoroughfare) \(subThoroughfare)"
            } else {
                return "\(subThoroughfare), \(thoroughfare), \(locality), \(administrativeArea), \(country)"
            }
        default:
            return ""
        }
    }
}

