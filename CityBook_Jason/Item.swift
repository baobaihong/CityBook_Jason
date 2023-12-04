//
//  Item.swift
//  CityBook_Jason
//
//  Created by Jason on 2023/12/4.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
