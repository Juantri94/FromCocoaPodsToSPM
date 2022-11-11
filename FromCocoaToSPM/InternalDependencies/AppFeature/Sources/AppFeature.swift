import SwiftUI
import struct ProductsFeature.ProductCoordinator
import struct SettingsFeature.SettingsCoordinator

import Appboy_iOS_SDK

public struct AppFeature: View {
    
    public init() {
        UITabBar.appearance().unselectedItemTintColor = .lightGray
        UITabBar.appearance().barTintColor = .gray
        UITabBar.appearance().backgroundColor = .gray

        Appboy().logCustomEvent("App starts")
    }

    public var body: some View {
        TabView {
            ProductCoordinator()
                .tabItem {
                    Image(systemName: "1.square.fill")
                    Text("Products")
                }
            SettingsCoordinator()
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
        AppFeature()
    }
}
