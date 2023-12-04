//
//  StreetList.swift
//  CityBook
//
//  Created by Jason on 2023/11/22.
//

import SwiftUI

struct StreetList: View {
    @EnvironmentObject var modelData: ModelData
    var street: [Street]
    //    @State var showPOI: Bool = false
    
    var body: some View {
        List(street) { street in
            DisclosureGroup(content: {
                ForEach(street.poiList){ poi in
                    POIRow(street: street, poi: poi) }
            }, label: { StreetRow(street: street) }
            )
        }
    }
}

#Preview {
    StreetList(street: ModelData().streets)
        .environmentObject(ModelData())
}
