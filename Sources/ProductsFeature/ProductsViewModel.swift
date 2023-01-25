
import Combine
import Product

public struct ProductsViewState {
  let products: [Product]
  var selectedIDs: Set<String>
  
  public init(products: [Product], selectedIDs: Set<String>) {
    self.products = products
    self.selectedIDs = selectedIDs
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
  
  public func update(_ selectedIDs: Set<String>) {
    state.selectedIDs = selectedIDs
  }
}
