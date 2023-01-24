
import Product
import SwiftUI

struct BasketView: View {
  @ObservedObject var viewModel: AppViewModel
  
  var body: some View {
    List(Array(viewModel.basket)) { item in
      Text(item.name)
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
