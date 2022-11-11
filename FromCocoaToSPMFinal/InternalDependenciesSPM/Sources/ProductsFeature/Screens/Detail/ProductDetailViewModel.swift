import Foundation
import Combine

@MainActor
final class ProductDetailViewModel: ObservableObject {
    
    private let product: Product
    @Published var productDetail: ProductDetail?
    
    init(product: Product) {
        self.product = product
    }

    func getData() async {
        do {
            productDetail = try await getProduct()
        } catch {
            print(error)
        }
    }

    private func getProduct() async throws -> ProductDetail? {
        return try await withCheckedThrowingContinuation({ continuation in
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
                continuation.resume(with: .success(ProductDetail(product: self.product)))
            }
        })
    }
}
