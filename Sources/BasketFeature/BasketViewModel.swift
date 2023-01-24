
import AppModel
import Combine
import Product

public class BasketViewModel: ObservableObject {
  @Published var basket: Set<Product> = []
  
  var model: AppModel
  var cancellables: Set<AnyCancellable> = []
  
  var total: Float {
    model.total
  }
  
  public init(model: AppModel) {
    self.model = model
    
    self.model.$basket
      .assign(to: \.basket, on: self)
      .store(in: &cancellables)
  }
  
  func remove(_ product: Product) {
    model.remove(product)
  }
}
