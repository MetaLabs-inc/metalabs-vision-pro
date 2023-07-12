//
//  metalabs_vision_proApp.swift
//  metalabs-vision-pro
//
//  Created by Marco Fiorito on 6/7/23.
//

import SwiftUI
import RealityKitContent

@main
struct metalabs_vision_proApp: App {
    // The view model.
    @State private var model = ViewModel()
    @State private var aboutUsImmersionStyle: ImmersionStyle = .mixed

    var body: some Scene {
        WindowGroup ("Content Screen", id: "content") {
            ContentView().environment(model)
        }
        
        // A volume that displays a the about us detail.
        WindowGroup(id: Module.aboutUs.name) {
            ModuleDetail(module: Module.aboutUs).environment(model)
        }
        .windowStyle(.volumetric)
        .defaultSize(width: 0.6, height: 0.6, depth: 0.6, in: .meters)
        
        // A volume that displays a the work detail.
        WindowGroup(id: Module.work.name) {
            ModuleDetail(module: Module.work).environment(model)
        }
        .windowStyle(.plain)
        .defaultSize(width: 0.6, height: 0.6, depth: 0.6, in: .meters)

        // A volume that displays a the careers detail.
        WindowGroup(id: Module.careers.name) {
            ModuleDetail(module: Module.careers).environment(model)
        }
        .windowStyle(.plain)
        .defaultSize(width: 0.6, height: 0.6, depth: 0.6, in: .meters)
        
        
        // A volume that displays a the contact us.
        WindowGroup(id: Module.contactUs.name) {
            ModuleDetail(module: Module.contactUs).environment(model)
        }
        .windowStyle(.plain)
        .defaultSize(width: 0.6, height: 0.6, depth: 0.6, in: .meters)
    }
}
