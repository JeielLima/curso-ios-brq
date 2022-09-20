//
//  ProjCRUDApp.swift
//  ProjCRUD
//
//  Created by Jeiel Lima on 20/09/22.
//

import SwiftUI

@main
struct ProjCRUDApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
