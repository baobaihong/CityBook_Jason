//
//  StreetRow.swift
//  CityBook
//
//  Created by Jason on 2023/11/22.
//

import SwiftUI

struct StreetRow: View {
//    @State var expanded: Bool = false
    var street: Street
    
    var body: some View {
        HStack {
            street.coverImage
                .resizable()
                .frame(width:48, height: 75)
            Text(street.title)
            Spacer()
        }
    }
}

#Preview {
    StreetRow(street: ModelData().streets[0])
}
