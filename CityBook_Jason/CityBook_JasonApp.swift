//
//  CityBook_JasonApp.swift
//  CityBook_Jason
//
//  Created by Jason on 2023/12/4.
//

import SwiftUI
import SwiftData

@main
struct CityBook_JasonApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            TabView {
                ExploreView()
                    .tabItem { Label("探索", systemImage: "globe.europe.africa.fill") }
                CollectionView()
                    .tabItem { Label("游线", systemImage: "rectangle.stack") }
            }
        }
        .modelContainer(sharedModelContainer)
        .environmentObject(ModelData())
    }
}
