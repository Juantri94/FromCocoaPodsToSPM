import Foundation
import Combine
import Alamofire
import Amplitude

@MainActor
final class ProductsListViewModel: ObservableObject {

    @Published private (set) var products: [Product] = []
    
    func sendOpenedViewEvent() {
        Amplitude.instance().logEvent("Opened product list")
    }
    
    func getProducts() async {
        do {
            _ = try await AF.request("https://httpbin.org/get").response
            guard products.isEmpty else { return }
            self.products = Product.list
        } catch {
            print("Error")
        }
    }

}
