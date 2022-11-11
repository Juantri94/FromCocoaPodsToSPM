import SwiftUI
import struct AppFeature.AppFeature

//import Appboy_iOS_SDK
//import AppboyKit // SPM

@main
struct FromCocoaToSPMApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            AppFeature()
        }
    }
}
