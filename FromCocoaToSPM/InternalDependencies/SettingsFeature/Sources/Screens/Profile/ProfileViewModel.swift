import Foundation
import Alamofire

@MainActor
final class ProfileViewModel {
    
    func loadProfile() async {
        do {
            _ = try await AF.request("https://httpbin.org/get").response
        } catch {
            print("Error")
        }
    }
}
