
import Product
import SwiftUI

struct BasketView: View {
  @ObservedObject var viewModel: AppViewModel
    
  var body: some View {
    ZStack {
      List(Array(viewModel.basket)) { product in
        ProductRow(product) {
          Button(action: { withAnimation { viewModel.remove(product) } }) {
            Image(systemName: "trash.fill")
              .foregroundColor(.red)
          }
        }
      }
      VStack {
        Spacer()
        TotalView(total: viewModel.total)
      }
    }
    .navigationTitle("Basket")
  }
}

struct BasketView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      BasketView(
        viewModel: AppViewModel(
          productFetcher: .preview,
          basket: Product.examples
        )
      )
    }
  }
}
