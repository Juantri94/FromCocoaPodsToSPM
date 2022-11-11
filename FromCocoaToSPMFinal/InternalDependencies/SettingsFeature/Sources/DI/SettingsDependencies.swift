
import Foundation

public protocol SettingsApiClient {
    func getData(for url: String) async throws -> Data
}

public protocol SettingsTracker {
    func sendEvent(_ event: String)
}

public struct SettingsDependencies {
    public init(
        apiClient: SettingsApiClient,
        tracker: SettingsTracker
    ) {
        self.apiClient = apiClient
        self.tracker = tracker
    }
    
    let apiClient: SettingsApiClient
    let tracker: SettingsTracker
}

// MARK: - Mocks

struct MockApiClient: SettingsApiClient {
    func getData(for url: String) async throws -> Data {
        Data()
    }
}

struct MockSettingsTracker: SettingsTracker {
    func sendEvent(_ event: String) {}
}

extension SettingsDependencies {
    
    public static var mock: SettingsDependencies {
        SettingsDependencies(apiClient: MockApiClient(), tracker: MockSettingsTracker())
    }
}

