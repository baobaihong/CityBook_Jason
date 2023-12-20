//
//  ExploreView.swift
//  CityBook
//
//  Created by Jason on 2023/11/28.
//

import SwiftUI
import MapKit

struct ExploreView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var detailStreet: Street? = nil
    @State private var content: Int? = 0
    @State private var poiId: POI.ID? = 0
    @State private var streetId: Int? = 0
    let coordinate = CLLocationCoordinate2D(latitude: 31.21017, longitude: 121.43575)
    @State private var childState: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Map bg view
            MapView(coordinate: coordinate)
            if content == 0 {
                ScrollView(Axis.Set.horizontal) {
                    HStack(spacing: 15) {
                        ForEach(modelData.streets) { street in
                            StreetBook(street: street).onTapGesture {
                                detailStreet = street }
                        }
                    }
                }
                .scrollIndicators(.never)
                .padding([.leading, .bottom], 35)
                .sheet(item: $detailStreet) { street in
                    StreetDetailView(showPOIDetail: $content, poiId: $poiId, streetId: $streetId, street: street)
                        .presentationDetents([.medium, .height(740)])
                        .presentationContentInteraction(.resizes)
                        .presentationCornerRadius(25)
                }
            } else if content == 1 {
                VStack {
                    ScrollView(Axis.Set.horizontal) {
                        HStack(spacing: 0) {
                            ForEach(modelData.streets[streetId!].poiList) { poi in
                                POICard(poi: poi).shadow(color: .black.opacity(0.16), radius: 16)
                                    .scrollTransition(.animated(.bouncy)) { content, phase in
                                        content.scaleEffect(phase.isIdentity ? 1 : 0.9)
                                    }
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollPosition(id: $poiId)
                    .scrollTargetBehavior(.paging)
                    .scrollClipDisabled()
                    .scrollIndicators(.never)
                    .padding([.horizontal, .bottom], 20)
                    Button(action: {
                        content = 0
                        detailStreet = modelData.streets[streetId!]
                    }, label: {
                        Text("返回\(modelData.streets[streetId!].title)")
                    })
                    .padding()
                    .background(.black)
                    .foregroundStyle(.white)
                    .clipShape(Capsule())
                }
            }
        }
        .toolbar(content == 1 ? .hidden : .visible, for: .tabBar)
    }
}

#Preview {
    ExploreView()
        .environmentObject(ModelData())
}
