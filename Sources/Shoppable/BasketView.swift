
import Product
import SwiftUI

struct BasketView: View {
  @ObservedObject var viewModel: AppViewModel
  
  var body: some View {
    List(Array(viewModel.basket)) { product in
      HStack {
        VStack(alignment: .leading) {
          Text(product.name)
            .font(.headline)
          Text(product.price.description)
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
        Spacer()
        Button(action: { /* viewModel.remove(product) */ }) {
          Text("Remove")
        }
      }
    }
  }
}

struct BasketView_Previews: PreviewProvider {
  static var previews: some View {
    BasketView(
      viewModel: AppViewModel(
        productFetcher: .preview,
        basket: Product.examples
      )
    )
  }
}
