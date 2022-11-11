import Foundation
import Combine
//import Alamofire
//import Amplitude

@MainActor
final class ProductsListViewModel: ObservableObject {

    @Published private (set) var products: [Product] = []
    private let apiClient: ProductsApiClient
    private let tracker: ProductsTracker
    
    init(
        apiClient: ProductsApiClient,
        tracker: ProductsTracker
    ) {
        self.apiClient = apiClient
        self.tracker = tracker
    }
    
    func sendOpenedViewEvent() {
        tracker.sendEvent("Opened product list")
    }
    
    func getProducts() async {
        do {
            _ = try await apiClient.getData(for: "https://httpbin.org/get")
            guard products.isEmpty else { return }
            self.products = Product.list
        } catch {
            print("Error")
        }
    }

}
