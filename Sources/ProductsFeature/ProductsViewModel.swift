
import Combine
import Product
import UIKit

public struct ProductsViewState {
  let products: [Product]
  var selectedIDs: Set<String>
  var images: [String : UIImage?]
  
  public init(products: [Product], selectedIDs: Set<String>, images: [String : UIImage?] = Dictionary()) {
    self.products = products
    self.selectedIDs = selectedIDs
    self.images = images
  }
}

public protocol ProductsViewModelDelegate: AnyObject {
  func add(_ product: Product)
}

public class ProductsViewModel: ObservableObject {
  @Published var state: ProductsViewState
  
  weak var delegate: ProductsViewModelDelegate?

  public init(state: ProductsViewState, delegate: ProductsViewModelDelegate) {
    self.state = state
    self.delegate = delegate
  }
  
  func add(_ product: Product) {
    delegate?.add(product)
  }
  
  func check(_ product: Product) -> Bool {
    state.selectedIDs.contains(product.id)
  }
  
  func image(_ product: Product) -> UIImage? {
    return state.images[product.id] ?? nil
  }
  
  public func update(_ selectedIDs: Set<String>) {
    state.selectedIDs = selectedIDs
  }
  
  public func update(_ images: [String : UIImage?]) {
    state.images = images
  }
}
