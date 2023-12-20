//
//  StreetDetailView.swift
//  CityBook
//
//  Created by Jason on 2023/11/22.
//

import SwiftUI

struct StreetDetailView: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.dismiss) private var dismiss
    @Binding var showPOIDetail: Int?
    @Binding var poiId: POI.ID?
    @Binding var streetId: Int?
    var buttonShow: Bool = true
    var street: Street
    
    var streetIndex: Int {
        modelData.streets.firstIndex(where: { $0.id == street.id })!
    }
    
    var body: some View {
        List {
            Section {
                // Image
                street.heroImage
                    .resizable()
                    .frame(height: 325)
                    .overlay(alignment: .topTrailing) {
                        Button { dismiss() } label: {
                            Image(systemName: "xmark.circle.fill")
                            .padding().font(.title).foregroundStyle(.white.opacity(buttonShow ? 0.5 : 0))}}
                // Title & Button
                VStack(spacing: 20) {
                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(street.title)
                                .font(.system(size: 30))
                            Text(street.feature.joined(separator: " | "))
                                .font(.system(size: 14))
                                .foregroundStyle(.gray)
                        }
                        Spacer()
                        HStack(spacing: 16) {
                            FavouriteButton(isSet: $modelData.streets[streetIndex].star)
                            ShareButton()
                        }
                    }
                    Text(street.description)
                        .font(.subheadline)
                    Rectangle()
                        .frame(height: 1)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal, 35)
            }
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets())
            .padding(.bottom, 20)
            // POI List Title
            Section {
                HStack(alignment: .firstTextBaseline) {
                    Text("兴趣点")
                        .font(.system(size: 24))
                    Text("\(street.poiList.count)个")
                        .font(.system(size: 14))
                        .foregroundStyle(.gray)
                    Spacer()
                }
            }
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
            .padding(.horizontal, 35)
            // POI List Row
            ForEach(street.poiList) { poi in
                POIRow(street: street, poi: poi)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 2))
                    .padding(.vertical, 10)
                    .simultaneousGesture(TapGesture().onEnded({ _ in
                        showPOIDetail = 1
                        poiId = poi.id
                        streetId = street.id
                        dismiss()
                    }))
            }
            .padding(.horizontal, 35)
            .listRowInsets(EdgeInsets())
            .listRowSeparator(.hidden)
        }
        .ignoresSafeArea()
        .listStyle(.inset)
        .scrollIndicators(.hidden)
    }
}

#Preview {
    StreetDetailView(showPOIDetail: .constant(0), poiId: .constant(0), streetId: .constant(0), street: ModelData().streets[0])
        .environmentObject(ModelData())
}
