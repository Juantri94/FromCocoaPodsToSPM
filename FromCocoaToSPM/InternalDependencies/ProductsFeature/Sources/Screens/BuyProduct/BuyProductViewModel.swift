import Foundation
import Alamofire
import Amplitude

struct BuyProductViewModel {
    
    let product: ProductDetail
    
    init(product: ProductDetail) {
        self.product = product
    }

    func payProduct() async {
        do {
            let response = try await AF.request("https://httpbin.org/get").response
            print(response)
            Amplitude.instance().logEvent("Product bought")
        } catch {
            print("Error")
        }
    }
}
