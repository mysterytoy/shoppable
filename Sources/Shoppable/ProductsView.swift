
import Product
import SwiftUI

struct ProductsView: View {
  @ObservedObject var viewModel: AppViewModel
  
  var body: some View {
    List {
      ForEach(viewModel.products) { product in
        ProductRow(product) {
          Button(action: { viewModel.add(product) }) {
            Text("Add")
          }
        }
      }
    }
    .navigationTitle("Products")
  }
}

struct ProductsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ProductsView(
        viewModel: AppViewModel(
          productFetcher: .preview
        )
      )
    }
  }
}
