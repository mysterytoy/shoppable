
import Combine
import Product
import UIKit

public struct BasketViewState {
  var basket: Set<Product>
  var images: [String : UIImage?]
  
  public init(basket: Set<Product>, images: [String : UIImage?] = Dictionary()) {
    self.basket = basket
    self.images = images
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
  
  func image(_ product: Product) -> UIImage? {
    return state.images[product.id] ?? nil
  }
  
  public func update(_ basket: Set<Product>) {
    state.basket = basket
  }
  
  public func update(_ images: [String : UIImage?]) {
    state.images = images
  }
}
