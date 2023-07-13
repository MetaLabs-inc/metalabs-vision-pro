//
//  ContentView.swift
//  metalabs-vision-pro
//
//  Created by Marco Fiorito on 6/7/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @Environment(ViewModel.self) private var model
    
    var body: some View {
        @Bindable var model = model

        NavigationStack(path: $model.navigationPath) {
            HStack {
                ForEach(Module.allCases) {
                    ModuleCard(module: $0)
                }
            }
            .navigationDestination(for: Module.self) { module in
                ModuleDetail(module: module)
                    .navigationTitle(module.eyebrow)      
            }
        }
    }
}

#Preview {
    ContentView()
}
