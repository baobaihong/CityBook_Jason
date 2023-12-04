//
//  BackPOICard.swift
//  CityBook
//
//  Created by Jason on 2023/11/29.
//

import SwiftUI

struct BackPOICard: View {
    var poi: POI
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(String(poi.id) + " " + poi.title).font(.system(size: 24))
                Spacer()
                HStack {
                    FavouriteButton(isSet: .constant(false))
                    ShareButton()
                }
            }
            Text(poi.feature.joined(separator: " | ")).font(.system(size: 14)).foregroundStyle(.gray)
            VStack(alignment: .leading, spacing: 2) {
                Text("地址：" + poi.address)
                Text("年份：" + String(poi.date))
                if let nickName = poi.nickName {
                    Text("别名：" + nickName)
                }
            }
            Text("\"" + poi.abstract + "\"").font(.system(size: 14))
            Rectangle().frame(height: 1).foregroundStyle(.secondary)
            Text(poi.description).font(.system(size: 14))
            Spacer()
            HStack(alignment: .center) {
                Spacer()
                Text(String(poi.id) + "/2").font(.system(size: 10)).foregroundStyle(.gray)
                Spacer()
            }
            .padding(.bottom, 5)
        }
        .padding([.top, .horizontal], 20)
        .frame(width: 330, height: 460)
        .background { Color.white }
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    BackPOICard(poi: ModelData().streets[0].poiList[0])
}
