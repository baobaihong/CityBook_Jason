//
//  POI.swift
//  CityBook
//
//  Created by Jason on 2023/11/22.
//

import Foundation
import SwiftUI
import CoreLocation

struct POI: Hashable, Identifiable {
    /// Basic property
    var id: Int
    var title: String
    var abstract: String
    var feature: [String]
    var address: String
    var date: Int
    var nickName: String?
    var description: String
    var star: Bool = false
    /// Image property
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    /// Coordinates for MapKit
    var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
