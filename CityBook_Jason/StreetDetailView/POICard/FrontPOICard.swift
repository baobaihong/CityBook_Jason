//
//  SwiftUIView.swift
//  CityBook
//
//  Created by Jason on 2023/11/29.
//

import SwiftUI

struct FrontPOICard: View {
    var poi: POI
    
    var body: some View {
        VStack(alignment: .center) {
            poi.image.resizable().scaledToFill().frame(width: 330, height: 360)
            VStack(alignment: .leading, spacing: 5) {
                Text(String(poi.id) + "  " + poi.title).font(.system(size: 24))
                Text(poi.abstract).font(.system(size: 14)).foregroundStyle(.gray).frame(height: 34).lineLimit(2)
            }
            .padding(.horizontal, 20)
            Spacer()
            HStack {
                Spacer()
                Text(String(poi.id) + "/2").font(.system(size: 10)).foregroundStyle(.gray)
                Spacer()
            }
            .padding(.bottom, 5)
        }
        .frame(width: 300, height: 460)
        .background { Color.white }
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    FrontPOICard(poi: ModelData().streets[0].poiList[0])
}
