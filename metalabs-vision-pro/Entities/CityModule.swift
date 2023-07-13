//
//  CityModule.swift
//  metalabs-vision-pro
//
//  Created by Marco Fiorito on 12/7/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

/// The model of the Earth.
struct CityModule: View {

    var body: some View {
        RealityView  { content in
            // Create an earth entity with tilt, rotation, a moon, and so on.
            guard let cityEntity = try? await ModelEntity(
                named: "City",
                in: realityKitContentBundle
            )else {
                fatalError("Unable to load City model.")
            }
            content.add(cityEntity)

        } update: { content in
            // Reconfigure everything when any configuration changes.
        }
    }
}

#Preview {
    CityModule()
}

