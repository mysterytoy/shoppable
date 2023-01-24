
import AppModel
import Product
import SwiftUI

public struct BasketView: View {
  @ObservedObject var viewModel: BasketViewModel
    
  public var body: some View {
    Group {
      if viewModel.basket.isEmpty {
        EmptyBasketView()
      } else {
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
      }
    }
    .navigationTitle("Basket")
  }
  
  public init(viewModel: BasketViewModel) {
    self.viewModel = viewModel
  }
}

struct BasketView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      BasketView(
        viewModel: BasketViewModel(
          model: AppModel(
            productFetcher: .preview,
            basket: Product.examples
          )
        )
      )
    }
  }
}
