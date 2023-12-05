//
//  Street.swift
//  CityBook
//
//  Created by Jason on 2023/11/22.
//

import Foundation
import SwiftUI
import CoreLocation

struct Street: Hashable, Identifiable {
    static func == (lhs: Street, rhs: Street) -> Bool {
        lhs.id == rhs.id && rhs.id == lhs.id
    }
    
    var id: Int
    var title: String
    var abstract: String
    var description: String
    var color: Color
    var star: Bool = false
    var isPurchased: Bool = false
    var price: Double = 6.00
    var feature: [String]
    
    var district: District
    enum District: String {
        case huangpu = "黄埔"
        case xuhui = "徐汇"
        case changning = "长宁"
        case jingan = "静安"
        case putuo = "普陀"
        case hongkou = "虹口"
        case yangpu = "杨浦"
    }
    
    var coverImageName: String
    var coverImage: Image {
        Image(coverImageName)
    }
    
    var heroImageName: String
    var heroImage: Image {
        Image(heroImageName)
    }
    
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
    
    var poiList: [POI]
}
