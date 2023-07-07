//
//  Module.swift
//  metalabs-vision-pro
//
//  Created by Marco Fiorito on 6/7/23.
//

import Foundation

/// A description of the modules that the app can present.
enum Module: String, Identifiable, CaseIterable, Equatable {
    case aboutUs, work, careers, contactUs
    var id: Self { self }
    var name: String { rawValue.capitalized }

    var eyebrow: String {
        switch self {
        case .aboutUs:
            "Get to know more about MetaLabs"
        case .work:
            "Our latest projects"
        case .careers:
            "Open positions"
        case .contactUs:
                "Let's schedule an intro call"
        }
    }

    var heading: String {
        switch self {
        case .aboutUs:
            "About Us"
        case .work:
            "Work"
        case .careers:
            "Careers"
        case .contactUs:
            "Contact us"
        }
    }

    var abstract: String {
        switch self {
        case .aboutUs:
            "abstract about us"
        case .work:
            "abstract work"
        case .careers:
            "abstract careers"
        case .contactUs:
            "abstract contact us"
        }
    }

    var overview: String {
        switch self {
        case .aboutUs:
            "overview about us."
        case .work:
            "overview work"
        case .careers:
            "overview careers"
        case .contactUs:
            "overview contact us"
        }
    }

    var callToAction: String {
        switch self {
        case .aboutUs: "View About Us"
        case .work: "View Work"
        case .careers: "View Careers"
        case .contactUs: "View Contact Us"
        }
    }

    static let funFacts = [
        "Iokc",
        "Iokc",
        "Iokc",
        "Iokc"
    ]
}
