
import Foundation

public protocol ProductsApiClient {
    func getData(for url: String) async throws -> Data
}

public protocol ProductsTracker {
    func sendEvent(_ event: String)
}

public struct ProductsDependencies {
    public init(
        apiClient: ProductsApiClient,
        tracker: ProductsTracker
    ) {
        self.apiClient = apiClient
        self.tracker = tracker
    }
    
    let apiClient: ProductsApiClient
    let tracker: ProductsTracker
}

// MARK: - Mocks

struct MockApiClient: ProductsApiClient {
    func getData(for url: String) async throws -> Data {
        Data()
    }
}

struct MockTracker: ProductsTracker {
    func sendEvent(_ event: String) {}
}

extension ProductsDependencies {
    
    public static var mock: ProductsDependencies {
        ProductsDependencies(apiClient: MockApiClient(), tracker: MockTracker())
    }
}

