//
//  LocationService.swift
//  
//
//  Created by Mooseok Bahng on 2023/07/07.
//

import CoreLocation
import Foundation
import NotificationCenter
import UserNotifications

public protocol LocationServiceProtocol {
    func isEnable() -> Bool
    func checkLocationAuthorization(isAlways: Bool)
    func fetchLocation(_ changeStatus: @escaping (Result<Location, LocationError>) -> Void)
    func updateNotification(
        id: String,
        title: String,
        body: String,
        center: CLLocationCoordinate2D,
        radius: CLLocationDistance,
        onEntry: Bool,
        onExit: Bool
    )
    func removeNotification(id: String)
}

public struct Location {
    public let longitude: Double
    public let latitude: Double

    public init(longitude: Double, latitude: Double) {
        self.longitude = longitude
        self.latitude = latitude
    }
}

public enum LocationError: Error {
    case denied
    case failed
}

public class LocationService: NSObject, LocationServiceProtocol {

    public static let shared = LocationService()
    
    private let locationManager = CLLocationManager()
    var locationUpdated: ((Result<Location, LocationError>) -> Void)?

    public override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager.distanceFilter = 100.0
    }

    public func isEnable() -> Bool {
        switch locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            return true

        default:
            return false
        }
    }
    
    public func checkLocationAuthorization(isAlways: Bool = false) {
        if isAlways {
            locationManager.requestAlwaysAuthorization()
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }

    public func fetchLocation(_ changeStatus: @escaping (Result<Location, LocationError>) -> Void) {
        if let coordinate = locationManager.location?.coordinate {
            changeStatus(
                .success(
                    .init(
                        longitude: coordinate.longitude,
                        latitude: coordinate.latitude
                    )
                )
            )
        } else if locationManager.authorizationStatus == .denied {
            changeStatus(.failure(.denied))
        } else {
            locationManager.startUpdatingLocation()
            self.locationUpdated = changeStatus
        }
    }
    
    public func updateNotification(
        id: String,
        title: String,
        body: String,
        center: CLLocationCoordinate2D,
        radius: CLLocationDistance,
        onEntry: Bool,
        onExit: Bool
    ) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.categoryIdentifier = "alarm"
        content.sound = UNNotificationSound.default
        
        // add userinfo
        
        let region = CLCircularRegion(center: center, radius: radius, identifier: id)
        region.notifyOnEntry = onEntry
        region.notifyOnExit = onExit
        let trigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    public func removeNotification(id: String) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [id])
    }
}

extension LocationService: CLLocationManagerDelegate {
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            locationUpdated?(.failure(.failed))
            return
        }
        locationUpdated?(
            .success(
                .init(
                    longitude: location.coordinate.longitude,
                    latitude: location.coordinate.latitude
                )
            )
        )
    }

    public func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .denied:
            locationUpdated?(.failure(.denied))
        default:
            break
        }
    }

}

