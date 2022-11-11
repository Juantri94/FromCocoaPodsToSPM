import Foundation
//import Alamofire
//import Amplitude

struct BuyProductViewModel {
    
    let product: ProductDetail
    
//    init(product: ProductDetail) {
//        self.product = product
//    }

    private let apiClient: ProductsApiClient
    private let tracker: ProductsTracker
    
    init(
        product: ProductDetail,
        apiClient: ProductsApiClient,
        tracker: ProductsTracker
    ) {
        self.product = product
        self.apiClient = apiClient
        self.tracker = tracker
    }
    
    func payProduct() async {
        do {
            let response = try await apiClient.getData(for: "https://httpbin.org/get")
            print(response)
            tracker.sendEvent("Product bought")
        } catch {
            print("Error")
        }
    }
}
