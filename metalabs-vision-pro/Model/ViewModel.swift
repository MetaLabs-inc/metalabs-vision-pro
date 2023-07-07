//
//  ViewModel.swift
//  metalabs-vision-pro
//
//  Created by Marco Fiorito on 6/7/23.
//
import SwiftUI
import Observation

/// The data that the app uses to configure its views.
@Observable
class ViewModel {
    
    // MARK: - Navigation
    var navigationPath: [Module] = []
    var titleText: String = ""
    var isTitleFinished: Bool = false
    var finalTitle: String = "Hello World"

    // MARK: - AboutUs
    var isShowingAboutUs: Bool = false
 
    // MARK: - Work
    var isShowingWork: Bool = false
    
    // MARK: - Careers
    var isShowingCareers: Bool = false
    
    // MARK: - ContactUs
    var isShowingContactUs: Bool = false
    
}
