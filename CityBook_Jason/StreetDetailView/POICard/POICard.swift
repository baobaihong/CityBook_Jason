//
//  POICard.swift
//  CityBook
//
//  Created by Jason on 2023/11/30.
//

import SwiftUI

struct POICard: View {
    @State private var flipped: Bool = false
    var front: Angle { flipped ? .degrees(180) : .degrees(0) }
    var back: Angle { flipped ? .degrees(0) : .degrees(-180) }
    var poi: POI
    
    var body: some View {
        Button {
            withAnimation { flipped.toggle() }
        } label: {
            ZStack {
                FrontPOICard(poi: poi)
                    .horizontalFlip(front, visible: !flipped)
                BackPOICard(poi: poi)
                    .horizontalFlip(back, visible: flipped)
            }
        }
        .frame(width: 330, height: 460)
        .buttonStyle(.plain)
        .focusEffectDisabled()
    }
}

#Preview {
    POICard(poi: ModelData().streets[0].poiList[0])
}
