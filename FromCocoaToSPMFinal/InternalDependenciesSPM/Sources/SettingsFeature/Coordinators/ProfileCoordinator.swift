import SwiftUI

@MainActor
struct ProfileCoordinator: View {
    
    @State private var path = NavigationPath()
    
    private let dependencies: SettingsDependencies
    
    init(dependencies: SettingsDependencies) {
        self.dependencies = dependencies
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            ProfileView(viewModel: ProfileViewModel(apiClient: dependencies.apiClient))
                .navigationDestination(for: ProfileRoute.self) { route in
                    self.openRoute(route)
                }
        }
    }

    @ViewBuilder
    private func openRoute(_ route: ProfileRoute) -> some View {
        switch route {
        case .editProfile:
            EditProfile()
        }
    }

}
