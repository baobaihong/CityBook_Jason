//
//  StreetView.swift
//  CityBook
//
//  Created by Jason on 2023/11/22.
//

import SwiftUI

struct CollectionView: View {
    @EnvironmentObject var modelData: ModelData
    @State private var selectedButtonIndex: Int? = 0
    let buttonTitle = ["全部", "已购", "收藏"]
    let buttonImage = ["books.vertical.fill", "cart.fill", "star.fill"]
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack {
                    ForEach(0 ..< 3) { index in
                        Button(buttonTitle[index], systemImage: buttonImage[index]) {
                            selectedButtonIndex = index
                        }
                        .padding()
                        .background(selectedButtonIndex == index ? Color.black : Color.white)
                        .foregroundColor(selectedButtonIndex == index ? Color.white : Color.gray)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.gray, lineWidth: 1))
                    }
                }
                switch selectedButtonIndex {
                case 0:
                    StreetBoard()
                case 1:
                    StreetList(street: modelData.isPurchased)
                case 2:
                    StreetList(street: modelData.stared)
                default:
                    StreetBoard()
                }
            }
        }
    }
    
}



#Preview {
    CollectionView()
        .environmentObject(ModelData())
}
