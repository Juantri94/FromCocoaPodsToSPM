import SwiftUI

@MainActor
public struct SettingsCoordinator: View {
    
    @State private var path = NavigationPath()
    
    public init() { }
    
    public var body: some View {
        NavigationStack(path: $path) {
            SettingsView()
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
