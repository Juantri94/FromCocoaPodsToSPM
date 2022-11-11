
import Foundation
import ProductsFeature
import Alamofire
import Amplitude

extension ProductsDependencies {
    
    static var dependencies: ProductsDependencies {
        ProductsDependencies(
            apiClient: ProductsApiClientImplementation(),
            tracker: ProductsTrackerImplementation())
    }
}

// Settings config

private struct ProductsApiClientImplementation: ProductsApiClient {
    func getData(for url: String) async throws -> Data {
        do {
            _ = try await AF.request(url).response
            return Data()
        } catch {
            print("Error")
        }
    }
}

private struct ProductsTrackerImplementation: ProductsTracker {
    func sendEvent(_ event: String) {
        Amplitude.instance().logEvent(event)
    }
}

