//
//  ModuleDetail.swift
//  metalabs-vision-pro
//
//  Created by Marco Fiorito on 6/7/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

/// A detail view that presents information about different module types.
struct ModuleDetail: View {
    @Environment(ViewModel.self) private var model

    var module: Module

    var body: some View {
        @Bindable var model = model

        GeometryReader { proxy in
            let textWidth = min(max(proxy.size.width * 0.4, 300), 500)
            let imageWidth = min(max(proxy.size.width - textWidth, 300), 700)
            ZStack {
                HStack(spacing: 60) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(module.heading)
                            .font(.system(size: 50, weight: .bold))
                            .padding(.bottom, 15)

                        Text(module.overview)
                            .padding(.bottom, 30)

                        switch module {
                        case .aboutUs:
                            WindowToggle(
                                title: module.callToAction,
                                id: module.name,
                                isShowing: $model.isShowingAboutUs)
                        case .work:
                            SpaceToggle(
                                title: module.callToAction,
                                id: module.name,
                                isShowing: $model.isShowingWork)
                        case .careers:
                            SpaceToggle(
                                title: module.callToAction,
                                id: module.name,
                                isShowing: $model.isShowingCareers)
                        case .contactUs:
                            SpaceToggle(
                                title: module.callToAction,
                                id: module.name,
                                isShowing: $model.isShowingContactUs)
                        }
                    }
                    .frame(width: textWidth, alignment: .leading)

                    module.detailView
                        .frame(width: imageWidth, alignment: .center)
            

                }
                .offset(y: -30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding(70)
   }
}

extension Module {
    @ViewBuilder
    fileprivate var detailView: some View {
        switch self {
        case .aboutUs:
            ModelsModule()
        case .work:
            RealityView { content in
                        let model = ModelEntity(
                                     mesh: .generateSphere(radius: 0.1),
                                     materials: [SimpleMaterial(color: .white, isMetallic: true)])
                        content.add(model)
            }
        case .careers:
            RealityView { content in
                        let model = ModelEntity(
                                     mesh: .generateSphere(radius: 0.1),
                                     materials: [SimpleMaterial(color: .white, isMetallic: true)])
                        content.add(model)
            }
        case .contactUs:
            RealityView { content in
                        let model = ModelEntity(
                                     mesh: .generateSphere(radius: 0.1),
                                     materials: [SimpleMaterial(color: .white, isMetallic: true)])
                        content.add(model)
            }
        }
    }
}

/// A toggle that activates or deactivates a window with
/// the specified identifier.
private struct WindowToggle: View {
    var title: String
    var id: String
    @Binding var isShowing: Bool

    @Environment(\.openWindow) private var openWindow
    @Environment(\.dismissWindow) private var dismissWindow

    var body: some View {
        Toggle(title, isOn: $isShowing)
            .onChange(of: isShowing) { wasShowing, isShowing in
                if isShowing {
                    openWindow(id: id)
                } else {
                    dismissWindow(id: id)
                }
            }
            .toggleStyle(.button)
    }
}

/// A toggle that activates or deactivates the immersive space with
/// the specified identifier.
private struct SpaceToggle: View {
    var title: String
    var id: String
    @Binding var isShowing: Bool

    @Environment(\.openImmersiveSpace) private var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace

    var body: some View {
        Toggle(title, isOn: $isShowing)
            .onChange(of: isShowing) { wasShowing, isShowing in
                Task {
                    if isShowing {
                        await openImmersiveSpace(id: id)
                    } else {
                        await dismissImmersiveSpace()
                    }
                }
            }
            .toggleStyle(.button)
    }
}

#Preview("AboutUs") {
    NavigationStack {
        ModuleDetail(module: .aboutUs)
            .environment(ViewModel())
    }
}

#Preview("Work") {
    NavigationStack {
        ModuleDetail(module: .work)
            .environment(ViewModel())
    }
}

#Preview("Careers") {
    NavigationStack {
        ModuleDetail(module: .careers)
            .environment(ViewModel())
    }
}

#Preview("AboutUs") {
    NavigationStack {
        ModuleDetail(module: .aboutUs)
            .environment(ViewModel())
    }
}
