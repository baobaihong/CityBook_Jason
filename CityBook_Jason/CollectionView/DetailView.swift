//
//  DetailView.swift
//  CityBook_Jason
//
//  Created by Jason on 2023/12/18.
//

import SwiftUI
import MapKit

struct DetailView: View {
    @EnvironmentObject var modelData: ModelData
    var street: Binding<Street?>
    @State private var content: Int? = 0
    @State private var poiId: POI.ID? = 0
    @State private var streetId: Int? = 0
    let coordinate = CLLocationCoordinate2D(latitude: 31.21017, longitude: 121.43575)
    
    var body: some View {
        ZStack(alignment: .bottom) {
            MapView(coordinate: coordinate)
                .toolbarBackground(.hidden, for: .navigationBar)
                .sheet(item: street) { street in
                    StreetDetailView(showPOIDetail: $content, poiId: $poiId, streetId: $streetId, buttonShow: false, street: street)
                        .interactiveDismissDisabled()
                        .presentationBackgroundInteraction(.enabled)
                        .presentationDetents([.medium, .height(720)])
                        .presentationContentInteraction(.resizes)
                }
            if content == 1 {
                VStack {
                    ScrollView(Axis.Set.horizontal) {
                        HStack(spacing: 0) {
                            ForEach(modelData.streets[streetId!].poiList) { poi in
                                POICard(poi: poi)
                                    .shadow(color: .black.opacity(0.16), radius: 16)
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
                        street.wrappedValue = modelData.streets[streetId!]
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
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    DetailView(street: .constant(ModelData().streets[0]))
        .environmentObject(ModelData())
}
