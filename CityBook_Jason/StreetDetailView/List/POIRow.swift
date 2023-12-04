//
//  POIRow.swift
//  CityBook
//
//  Created by Jason on 2023/11/22.
//

import SwiftUI

struct POIRow: View {
    @EnvironmentObject var modelData: ModelData
    var street: Street
    var poi: POI
    var streetIndex: Int {
        modelData.streets.firstIndex(where: { $0.id == street.id })!
    }
    var poiIndex: Int {
        modelData.streets[streetIndex].poiList.firstIndex(where: { $0.id == poi.id })!
    }
    
    var body: some View {
        HStack(alignment: .center, spacing: 10.0) {
            poi.image
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text(String(poi.id))
                    Text(poi.title)
                    Spacer()
                    Image(systemName: "star.fill")
                        .opacity(modelData.streets[streetIndex].poiList[poiIndex].star ? 1 : 0)
                        .foregroundStyle(.yellow)
                }
                Text(poi.abstract)
                    .font(.system(size: 14))
                    .foregroundStyle(.secondary)
            }
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
            FavouriteButton(isSet: $modelData.streets[streetIndex].poiList[poiIndex].star).tint(.orange)
        }
    }
}

#Preview {
    POIRow(street: ModelData().streets[0], poi: ModelData().streets[0].poiList[0])
        .environmentObject(ModelData())
}
