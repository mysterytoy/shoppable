
import Product
import SwiftUI

public struct BasketView: View {
  @ObservedObject var viewModel: BasketViewModel
    
  public var body: some View {
    Group {
      if viewModel.state.basket.isEmpty {
        EmptyBasketView()
      } else {
        ZStack {
          List(Array(viewModel.state.basket)) { product in
            ProductRow(product, image: viewModel.image) {
              Button(action: { withAnimation { viewModel.remove(product) } }) {
                Image(systemName: "trash.fill")
                  .foregroundColor(.red)
              }
              .accessibilityValue("Double tap to delete")
            }
            .accessibilityElement(children: .combine)
          }
          VStack {
            Spacer()
            TotalView(total: viewModel.total)
              .accessibilityElement(children: .combine)
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
          state: BasketViewState(
            basket: Set(Product.examples)
          ),
          delegate: PreviewModelDelegate()
        )
      )
    }
  }
  
  private class PreviewModelDelegate: BasketViewModelDelegate {
    func remove(_ product: Product) {}
  }
}
