import SwiftUI

@MainActor
public struct ProductCoordinator: View {
    
    @State private var path = NavigationPath()
    
//    public init() { }
    
    private let dependencies: ProductsDependencies
    
    public init(dependencies: ProductsDependencies) {
        self.dependencies = dependencies
    }
    
    public var body: some View {
        NavigationStack(path: $path) {
            ProductsListView(viewModel: ProductsListViewModel(apiClient: dependencies.apiClient, tracker: dependencies.tracker))
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
                viewModel: BuyProductViewModel(
                    product: product,
                    apiClient: dependencies.apiClient,
                    tracker: dependencies.tracker
                ),
                goBackToRoot: { path.removeLast(path.count) }
            )
        }
    }
    
}
