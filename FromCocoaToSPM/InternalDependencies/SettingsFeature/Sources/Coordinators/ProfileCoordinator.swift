import SwiftUI

@MainActor
struct ProfileCoordinator: View {
    
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ProfileView(viewModel: ProfileViewModel())
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
