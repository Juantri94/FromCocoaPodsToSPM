import SwiftUI
import UIComponents

struct BuyProductView: View {

    let viewModel: BuyProductViewModel
    let goBackToRoot: () -> Void

    var body: some View {
        CommonButton(action: {
            Task {
                await viewModel.payProduct()
                goBackToRoot()
            }
        }, text: "Pay")
    }
}

struct BuyProductView_Previews: PreviewProvider {
    @State static var state: [ProductRoute] = []
    @State static var path = NavigationPath()

    static var previews: some View {
        BuyProductView(
            viewModel: BuyProductViewModel(
                product: .randomProduct
            ),
            goBackToRoot: {})
    }
}
