//
//  ContentView.swift
//  LocationGuru
//
//  Created by FUKA on 1.4.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var locationManager = LocationManager.shared
    
    var body: some View {
        Group {
            if locationManager.userLocation == nil {
                LocationRequestView()
            } else if let location = locationManager.userLocation {
                Text("Latitude: \(location.coordinate.latitude)")
                    .padding()
                Text("Longitude: \(location.coordinate.longitude)")
                    .padding()
                Text("Timestamp: \(location.timestamp)")
                    .padding()
                Text("Latitude\(location)")
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
