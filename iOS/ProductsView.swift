
import Product
import SwiftUI

struct ProductsView: View {
  @ObservedObject var viewModel: AppViewModel
  
  var body: some View {
    List {
      ForEach(viewModel.products) { product in
        Text(product.name)
      }
    }
  }
}

struct ProductsView_Previews: PreviewProvider {
  static var previews: some View {
    ProductsView(
      viewModel: AppViewModel(
        productFetcher: .stub
      )
    )
  }
}
