
import Product
import SwiftUI

struct ProductsView: View {
  @ObservedObject var viewModel: AppViewModel
  
  var body: some View {
    List {
      ForEach(viewModel.products) { product in
        HStack {
          VStack(alignment: .leading) {
            Text(product.name)
              .font(.headline)
            Text(product.info.description)
              .font(.subheadline)
              .foregroundColor(.secondary)
          }
          Spacer()
          Button(action: { viewModel.add(product) }) {
            Text("Add")
          }
        }
      }
    }
  }
}

struct ProductsView_Previews: PreviewProvider {
  static var previews: some View {
    ProductsView(
      viewModel: AppViewModel(
        productFetcher: .preview
      )
    )
  }
}
