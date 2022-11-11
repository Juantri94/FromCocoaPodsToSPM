/*
import Foundation
import SettingsFeature
import Alamofire
import Amplitude

extension SettingsDependencies {
    
    static var dependencies: SettingsDependencies {
        SettingsDependencies(
            apiClient: SettingsApiClientImplementation(),
            tracker: SettingsTrackerImplementation())
    }
}

// Settings config

private struct SettingsApiClientImplementation: SettingsApiClient {
    func getData(for url: String) async throws -> Data {
        do {
            _ = try await AF.request(url).response
            return Data()
        } catch {
            print("Error")
        }
    }
}

private struct SettingsTrackerImplementation: SettingsTracker {
    func sendEvent(_ event: String) {
        Amplitude.instance().logEvent(event)
    }
}

*/
