//
//  AllStreetBoard.swift
//  CityBook
//
//  Created by Jason on 2023/11/22.
//

import SwiftUI

struct StreetBoard: View {
    @EnvironmentObject var modelData: ModelData
    @State private var detailStreet: Street? = nil
    
    var districts: [String] {
        var allDistrict: [String] = []
        let districts = modelData.distribution.keys
        for district in districts { allDistrict.append(district) }
        return allDistrict.sorted { $0 > $1 }
    }
    
    let columns = [GridItem(.fixed(160), spacing: 10, alignment: .center),
                   GridItem(.fixed(160), spacing: 10, alignment: .center)]
    
    var body: some View {
        ScrollView {
            ForEach(districts, id: \.self) { district in
                VStack {
                    HStack {
                        Text(district)
                            .font(.headline)
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    
                    if let streets = modelData.distribution[district] {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(streets) { street in
                                NavigationLink (destination: DetailView(street: $detailStreet)) {
                                    StreetBook(street: street)
                                }
                                .simultaneousGesture(TapGesture().onEnded {
                                    detailStreet = street
                                })
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
        }
        .padding(.top)
        
    }
    
    
}

#Preview {
    StreetBoard()
        .environmentObject(ModelData())
}


