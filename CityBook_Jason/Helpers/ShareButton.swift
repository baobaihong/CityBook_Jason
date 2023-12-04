//
//  ShareButton.swift
//  CityBook
//
//  Created by Jason on 2023/11/22.
//

import SwiftUI

struct ShareButton: View {
    var body: some View {
        Button {
            print("share street")
        } label: {
            Label("Share Street", systemImage: "square.and.arrow.up")
                .foregroundStyle(.black)
                .labelStyle(.iconOnly)
        }
    }
}

#Preview {
    ShareButton()
}
