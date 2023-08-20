//
//  CLLocationCoordinate2D+Extension.swift
//  
//
//  Created by Mooseok Bahng on 2023/07/08.
//

import MapKit

extension CLLocationCoordinate2D {
    
    /// Returns the distance between two coordinates in meters.
    public func distance(to: CLLocationCoordinate2D) -> CLLocationDistance {
        MKMapPoint(self).distance(to: MKMapPoint(to))
    }
    
}
