import SwiftUI

struct ProductsListView: View {

    @ObservedObject private var viewModel: ProductsListViewModel
    
    init(viewModel: ProductsListViewModel) {
        self.viewModel = viewModel
        viewModel.sendOpenedViewEvent()
    }

    var body: some View {
        mainView
            .task {
                await viewModel.getProducts()
            }
            .navigationTitle("Products")
    }
    
    @ViewBuilder
    private var mainView: some View {
        if viewModel.products.isEmpty {
            ProgressView()
        } else {
            List {
                ForEach(viewModel.products) { product in
                    NavigationLink(value: ProductRoute.detail(product)) {
                        Text(product.name)
                    }
                }
            }
        }
    }
}

struct ProductsListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsListView(viewModel: ProductsListViewModel())
    }
}
