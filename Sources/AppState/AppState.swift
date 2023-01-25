
import BasketFeature
import Foundation
import Product
import ProductsFeature

public class AppState: ProductsViewModelDelegate, BasketViewModelDelegate {
  public let products: [Product]
  
  public var basket: Set<Product> {
    didSet {
      self.observers.forEach { observer in
        observer(basket)
      }
    }
  }
  
  var observers: [(Set<Product>) -> Void] = Array()
  
  public init(productFetcher: ProductFetcher, basket: [Product] = Array()) {
    do {
      self.products = try productFetcher.fetch()
      self.basket = Set(basket)
    }
    catch {
      fatalError("Could not fetch products")
    }
  }
  
  public func addObserver(observer: @escaping (Set<Product>) -> Void) {
    self.observers.append(observer)
  }

  public func add(_ product: Product) {
    self.basket.insert(product)
  }
  
  public func remove(_ product: Product) {
    self.basket.remove(product)
  }
}
