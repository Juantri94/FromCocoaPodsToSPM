import SwiftUI

struct ProfileView: View {
    
    private let viewModel: ProfileViewModel
    
    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationLink(value: ProfileRoute.editProfile) {
            Text("Edit profile")
        }
        .task {
            await viewModel.loadProfile()
        }
        .navigationTitle(Text("Profile"))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(apiClient: MockApiClient()))
    }
}
