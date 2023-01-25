
import Combine
import Product

public struct BasketViewState {
  var basket: Set<Product>
  
  public init(basket: Set<Product>) {
    self.basket = basket
  }
}

public protocol BasketViewModelDelegate: AnyObject {
  func remove(_ product: Product)
}

public class BasketViewModel: ObservableObject {
  @Published var state: BasketViewState

  weak var delegate: BasketViewModelDelegate?
  
  var total: Float {
    state.basket
      .map(\.price.value)
      .reduce(0, +)
  }
  
  public init(state: BasketViewState, delegate: BasketViewModelDelegate) {
    self.state = state
    self.delegate = delegate
  }
  
  func remove(_ product: Product) {
    delegate?.remove(product)
  }
  
  public func update(_ basket: Set<Product>) {
    state.basket = basket
  }
}
