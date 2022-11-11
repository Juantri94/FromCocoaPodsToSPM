import Foundation
//import Alamofire

@MainActor
final class ProfileViewModel {
    
    private let apiClient: SettingsApiClient
    
    init(apiClient: SettingsApiClient) {
        self.apiClient = apiClient
    }
    
    func loadProfile() async {
        do {
            _ = try await apiClient.getData(for: "https://httpbin.org/get")
        } catch {
            print("Error")
        }
    }
}
