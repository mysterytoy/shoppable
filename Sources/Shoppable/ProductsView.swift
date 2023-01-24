
import Combine
import Product
import SwiftUI

class ProductsViewModel: ObservableObject {
  var products: [Product] {
    model.products
  }
  
  @Published var basket: Set<Product> = []
  
  var model: AppModel
  var cancellables: Set<AnyCancellable> = []

  init(model: AppModel) {
    self.model = model
    self.model.$basket
      .assign(to: \.basket, on: self)
      .store(in: &cancellables)
  }
  
  func add(_ product: Product) {
    model.add(product)
  }
  
  func check(_ product: Product) -> Bool {
    model.check(product)
  }
}

struct ProductsView: View {
  @ObservedObject var viewModel: ProductsViewModel
  
  var body: some View {
    List {
      ForEach(viewModel.products) { product in
        ProductRow(product) {
          Button(action: { viewModel.add(product) }) {
            Image(
              systemName: viewModel.check(product)
              ? "checkmark.circle.fill"
              : "plus.circle.fill"
            )
          }
          .disabled(viewModel.check(product))
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
        viewModel: ProductsViewModel(
          model: AppModel(
            productFetcher: .preview
          )
        )
      )
    }
  }
}
