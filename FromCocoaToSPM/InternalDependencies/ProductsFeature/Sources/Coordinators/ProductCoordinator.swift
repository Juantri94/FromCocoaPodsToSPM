import SwiftUI

@MainActor
public struct ProductCoordinator: View {
    
    @State private var path = NavigationPath()
    
    public init() { }
    
    public var body: some View {
        NavigationStack(path: $path) {
            ProductsListView(viewModel: ProductsListViewModel())
                .navigationDestination(for: ProductRoute.self) { route in
                    self.openProductRoute(route)
                }
        }
    }

    @ViewBuilder
    private func openProductRoute(_ route: ProductRoute) -> some View {
        switch route {
        case let .detail(product):
            ProductDetailView(viewModel: ProductDetailViewModel(product: product))
        case let .buyProduct(product):
            BuyProductView(
                viewModel: BuyProductViewModel(product: product),
                goBackToRoot: { path.removeLast(path.count) }
            )
        }
    }
    
}
