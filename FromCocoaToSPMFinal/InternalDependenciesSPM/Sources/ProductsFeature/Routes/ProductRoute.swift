import Foundation

enum ProductRoute: Hashable {
    case detail(Product)
    case buyProduct(ProductDetail)
}
