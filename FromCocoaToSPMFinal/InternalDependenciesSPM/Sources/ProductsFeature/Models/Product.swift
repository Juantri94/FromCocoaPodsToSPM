import Foundation

struct Product: Identifiable {
    let id: UUID = UUID()
    let name: String
    let price: Double
}

extension Product: Hashable { }

extension Product {

    static var list: [Product] = [
        Product(name: "1kg Apple", price: 2.34),
        Product(name: "Rice", price: 0.89),
        Product(name: "Orange Juice", price: 1.25),
        Product(name: "Cheese", price: 3.10),
        Product(name: "400g Chicken Breast", price: 2.01)
    ]
    
    static var randomProduct: Product = {
        Product.list.randomElement()!
    }()
}
