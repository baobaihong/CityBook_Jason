//
//  StreetBook.swift
//  CityBook
//
//  Created by Jason on 2023/11/22.
//

import SwiftUI

struct StreetBook: View {
    @EnvironmentObject var modelData: ModelData
    var street: Street
    
    var streetIndex: Int { modelData.streets.firstIndex(where: { $0.id == street.id })! }
    
    var body: some View {
        VStack(alignment: .center) {
            Text(street.title)
                .font(.system(size: 20))
                .foregroundStyle(.white)
            Rectangle().fill(Color.white).frame(width: 120, height: 1)
            Spacer()
            Text(street.abstract)
                .font(.system(size: 10))
                .foregroundStyle(.white)
                .lineLimit(2)
        }
        .padding(EdgeInsets(top: 30, leading: 20, bottom: 20, trailing: 20))
        .background {
            street.coverImage
                .resizable()
                .scaledToFill()
        }
        .frame(width: 160, height: 250)
        .clipped()
    }
}

#Preview {
    StreetBook(street: ModelData().streets[1])
        .environmentObject(ModelData())
}
