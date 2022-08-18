//
//  LocationHelper.swift
//  iOSCourse
//
//  Created by Giselle Salvador on 2022-08-18.
//

import CoreLocation
import Foundation

class LocationHelper: NSObject, CLLocationManagerDelegate {
    
static let shared = LocationHelper()
let manager = CLLocationManager()
var completion: ((CLLocation) -> Void)?
    
public func getUserLocation(completion: @escaping ((CLLocation) -> Void)) {
    self.completion = completion
    manager.requestWhenInUseAuthorization()
    manager.delegate = self
    manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:
    [CLLocation]) {
    guard let location = locations.first else {
    return
    }
        completion?(location)
        manager.stopUpdatingLocation()
    }
    
}
    
