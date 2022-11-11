import SwiftUI
import UIComponents
//import Amplitude

struct SettingsView: View {
    
    @State private var showProfile: Bool = false
    
//    init() {
//        Amplitude.instance().logEvent("Open settings")
//    }

    private let dependencies: SettingsDependencies
    
    init(dependencies: SettingsDependencies) {
        self.dependencies = dependencies
        dependencies.tracker.sendEvent("Open settings")
    }
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Settings")

            CommonButton(action: {
                self.showProfile = true
            }, text: "Open profile")
            
            
            NavigationLink(value: SettingsRoute.notifications) {
                Text("Open notifications")
            }
        }
        .sheet(isPresented: $showProfile) {
            ProfileCoordinator(dependencies: dependencies)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(dependencies: .mock)
    }
}
