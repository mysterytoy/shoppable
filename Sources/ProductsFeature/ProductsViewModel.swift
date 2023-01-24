
import AppModel
import Combine
import Product

public class ProductsViewModel: ObservableObject {
  var products: [Product] {
    model.products
  }
  
  @Published var basket: Set<Product> = []
  
  var model: AppModel
  var cancellables: Set<AnyCancellable> = []

  public init(model: AppModel) {
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
