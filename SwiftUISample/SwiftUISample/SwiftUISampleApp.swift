//
//  SwiftUISampleApp.swift
//  SwiftUISample
//  Created by Purva Bhureja
//
import SwiftUI

@main
struct SwiftUISampleApp: App {
@StateObject var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
