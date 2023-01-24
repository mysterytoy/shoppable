
import Combine
import Product
import SwiftUI

class BasketViewModel: ObservableObject {
  @Published var basket: Set<Product> = []
  
  var model: AppModel
  var cancellables: Set<AnyCancellable> = []
  
  var total: Float {
    model.total
  }
  
  init(model: AppModel) {
    self.model = model
    
    self.model.$basket
      .assign(to: \.basket, on: self)
      .store(in: &cancellables)
  }
  
  func remove(_ product: Product) {
    model.remove(product)
  }
}

struct BasketView: View {
  @ObservedObject var viewModel: BasketViewModel
    
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
