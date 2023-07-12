//
//  Cathedral.swift
//  metalabs-vision-pro
//
//  Created by Marco Fiorito on 12/7/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

private let modelDepth: Double = 200

/// The list of 3D models to display in the winow.
private enum Item: String, CaseIterable, Identifiable {
    case cathedral
    var id: Self { self }
    var name: String { rawValue.capitalized }
}

struct CathedralModule: View {
    @Environment(ViewModel.self) private var model
    @State private var selection: Item = .cathedral

    var body: some View {
        VStack(spacing: 100) {
            Color.clear
                .overlay {
                    ItemView(item: .cathedral, orientation: [0, 0, 0])
                        .opacity(selection == .cathedral ? 1 : 0)
                }

            Picker("Cathedral", selection: $selection) {
                ForEach(Item.allCases) { item in
                    Text(item.name)
                }
            }
            .pickerStyle(.segmented)
            .frame(width: 350)
        }
    }
}


/// A model of a cathedral.
private struct ItemView: View {
    var item: Item
    var orientation: SIMD3<Double> = .zero
    
    var body: some View {
        Model3D(named: item.name, bundle: realityKitContentBundle) { model in
            model.resizable()
                .scaledToFit()
                .rotation3DEffect(
                    Rotation3D(
                        eulerAngles: .init(angles: orientation, order: .xyz)
                    )
                )
                .frame(depth: modelDepth)
                .offset(z: -modelDepth / 2)
        } placeholder: {
            ProgressView()
                .offset(z: -modelDepth * 0.75)
        }
    }
}

#Preview {
    CathedralModule()
        .padding()
        .glassBackgroundEffect()
        .environment(ViewModel())
}
