import SwiftUI

@MainActor
public struct SettingsCoordinator: View {
    
    @State private var path = NavigationPath()
    
//    public init() { }
    
    private let dependencies: SettingsDependencies
    
    public init(dependencies: SettingsDependencies) {
        self.dependencies = dependencies
    }
    
    public var body: some View {
        NavigationStack(path: $path) {
            SettingsView(dependencies: dependencies)
                .navigationDestination(for: SettingsRoute.self) { route in
                    self.openRoute(route)
                }
        }
    }

    @ViewBuilder
    private func openRoute(_ route: SettingsRoute) -> some View {
        switch route {
        case .notifications:
            NotificationsView()
        }
    }

}
