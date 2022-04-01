//
//  LocationManager.swift
//  LocationGuru
//
//  Created by FUKA on 1.4.2022.
//


/* Manage location services */


import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let manager = CLLocationManager() // Used to request location services from the user, monitor changes in location status etc..
    @Published var userLocation: CLLocation? // Its initially nil until we request it from the user
    static let shared = LocationManager() // Access LocationManager anywhere
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    /* add Privacy - Location When In Use Usage Description to plist */
    func requestLocation() { // Request permission
        manager.requestWhenInUseAuthorization()
        // manager.requestAlwaysAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    
    // Monitors changes on user's location status, it starts as Undetermined and when user allows access, permission status changes and then this function is called
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .notDetermined:
            print("Not determined")
        case .restricted:
            print("Restricted")
        case .denied:
            print("Denied")
        case .authorizedWhenInUse:
            print("Authorized when app in use")
        case .authorizedAlways:
            print("Authorized always")
        @unknown default:
            break
        }
    }
    
    // User location is recieved and we update ->  @Published var userLocation
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.userLocation = location
    }
}
