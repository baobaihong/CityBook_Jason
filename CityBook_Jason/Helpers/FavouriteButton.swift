//
//  FavouriteButton.swift
//  CityBook
//
//  Created by Jason on 2023/11/22.
//

import SwiftUI

struct FavouriteButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Star", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .black)
        }
    }
}

#Preview {
    FavouriteButton(isSet: .constant(true))
}
