//
//  CargoContainerSUIApp.swift
//  CargoContainerSUI
//
//  Created by Никита Гуляев on 27.07.2024.
//

import SwiftUI

@main
struct CargoContainerSUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(cargo1Height: "", cargo1Width: "", cargo1Depth: "", cargo2Height: "", cargo2Width: "", cargo2Depth: "", combinedCargo: Cargo(width: 0, height: 0, depth: 0))
        }
    }
}
