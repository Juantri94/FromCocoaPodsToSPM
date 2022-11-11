import SwiftUI
import struct ProductsFeature.ProductCoordinator
import struct SettingsFeature.SettingsCoordinator

//import Appboy_iOS_SDK

public struct AppFeature: View {
    
    private let dependencies: AppFeatureDependencies
    
    public init(appboyTracker: AppboyTracker, dependencies: AppFeatureDependencies) {
        UITabBar.appearance().unselectedItemTintColor = .lightGray
        UITabBar.appearance().barTintColor = .gray
        UITabBar.appearance().backgroundColor = .gray

        appboyTracker.logCustomEvent("App starts")
        
        self.dependencies = dependencies
    }

    public var body: some View {
        TabView {
            ProductCoordinator(dependencies: dependencies.productDependencies)
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Products")
                }
            SettingsCoordinator(dependencies: dependencies.settingsDependencies)
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Settings")
                }
        }
        .accentColor(.blue)
    }

}

struct AppFeature_Previews: PreviewProvider {
    static var previews: some View {
        AppFeature(appboyTracker: MockAppboyTracker(), dependencies: .mock)
    }
}
