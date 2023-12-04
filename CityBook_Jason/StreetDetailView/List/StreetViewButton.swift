//
//  StreetViewButton.swift
//  CityBook
//
//  Created by Jason on 2023/11/22.
//

import SwiftUI

struct StreetViewButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .foregroundStyle(.white)
                .padding()
                .background(Capsule().fill(Color.blue))
        }
    }
}

#Preview {
    StreetViewButton(title: "全部") {
        print("Button Tapped")
    }
}
