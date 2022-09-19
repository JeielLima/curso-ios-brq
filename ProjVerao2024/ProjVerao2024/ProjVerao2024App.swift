//
//  ProjVerao2024App.swift
//  ProjVerao2024
//
//  Created by Jeiel Lima on 15/09/22.
//

import SwiftUI
import ObjectiveC

@main
struct ProjVerao2024App: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
