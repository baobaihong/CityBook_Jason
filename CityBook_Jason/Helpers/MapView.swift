//
//  MapView.swift
//  CityBook
//
//  Created by Jason on 2023/11/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        Map {
            Marker("street", coordinate: coordinate)
        }
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 31.21017, longitude: 121.43575))
}
