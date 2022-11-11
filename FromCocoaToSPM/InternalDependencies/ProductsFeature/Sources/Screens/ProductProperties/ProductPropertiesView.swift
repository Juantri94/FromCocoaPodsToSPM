import SwiftUI

struct ProductPropertiesView: View {

    let viewModel: ProductPropertiesViewModel

    var body: some View {
        Text(viewModel.properties)
    }
}

struct ProductPropertiesView_Previews: PreviewProvider {
    static var previews: some View {
        ProductPropertiesView(viewModel: ProductPropertiesViewModel(properties: "Properties"))
    }
}
