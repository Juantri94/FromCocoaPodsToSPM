import SwiftUI

struct ProductDetailView: View {
    
    @State private var presentPropertiesView: Bool = false
    
    @StateObject var viewModel: ProductDetailViewModel
    
    var body: some View {
        mainView
            .task {
                await viewModel.getData()
            }
            .sheet(isPresented: $presentPropertiesView, content: {
                if let product = viewModel.productDetail {
                    ProductPropertiesView(viewModel: ProductPropertiesViewModel(properties: product.properties))
                }
            })
            .frame(maxWidth: .infinity)
            .padding()
    }
    
    @ViewBuilder
    private var mainView: some View {
        if viewModel.productDetail != nil {
            VStack(spacing: 16) {
                productName
                    .padding(.top, 8)
                productPrice
                    .padding(.top, 32)
                productProperties
                productAvailability
                buyButton
                Spacer()
            }
        } else {
            ProgressView()
        }
    }
    
    @ViewBuilder
    private var productName: some View {
        if let product = viewModel.productDetail {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Product name")
                        .font(.title)
                        .fontWeight(.bold)
                    Text(product.name)
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    private var productPrice: some View {
        if let product = viewModel.productDetail {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Product price:")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("\(product.priceString)€")
                        .font(.title3)
                }
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    private var productProperties: some View {
        if let product = viewModel.productDetail {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Product properties")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text(product.properties)
                        .font(.title3)
                    Button {
                        self.presentPropertiesView = true
                    } label: {
                        Text("More properties")
                    }
                }
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    private var productAvailability: some View {
        if let product = viewModel.productDetail {
            HStack {
                HStack(spacing: 8) {
                    Text("Available:")
                        .font(.title2)
                        .fontWeight(.bold)
                    (product.available ? Color.green : Color.red)
                        .frame(width: 20, height: 20)
                }
                Spacer()
            }
        }
    }
    
    @ViewBuilder
    private var buyButton: some View {
        if let product = viewModel.productDetail {
            NavigationLink(value: ProductRoute.buyProduct(product)) {
                Text("Buy")
            }
            .frame(maxWidth: .infinity, minHeight: 40)
            .background(Color.blue)
            .foregroundColor(.white)
            .padding()
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(viewModel: ProductDetailViewModel(product: .randomProduct))
    }
}
