import Foundation

struct ProductDetail: Identifiable {
    let id: UUID
    let name: String
    let price: Double
    let available: Bool
    let properties: String

    init(product: Product) {
        self.id = product.id
        self.name = product.name
        self.price = product.price
        self.available = Bool.random()
        self.properties = "Origin: Spain"
    }
}

extension ProductDetail: Hashable { }

extension ProductDetail {

    var priceString: String {
        String(format: "%.2f", price)
    }

    static var randomProduct: ProductDetail = {
        ProductDetail(product: Product.list.randomElement()!)
    }()
}
