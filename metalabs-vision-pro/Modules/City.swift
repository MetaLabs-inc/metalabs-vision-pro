//
//  City.swift
//  metalabs-vision-pro
//
//  Created by Marco Fiorito on 12/7/23.
//

import SwiftUI
import RealityKit

/// The model content for the orbit module.
struct City: View {
    @Environment(ViewModel.self) private var model

    var body: some View {
        CityModule()
    }
}

