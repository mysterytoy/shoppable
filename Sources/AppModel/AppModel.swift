
import Foundation
import Product

public class AppModel: ObservableObject {
  public let products: [Product]

  @Published public var basket: Set<Product>
  
  public var total: Float {
    basket.map(\.price.value)
      .reduce(0.0, +)
  }
  
  public init(productFetcher: ProductFetcher, basket: [Product] = Array()) {
    do {
      self.products = try productFetcher.fetch()
      self.basket = Set(basket)
    }
    catch {
      fatalError("Could not fetch products")
    }
  }
  
  public func add(_ product: Product) {
    self.basket.insert(product)
  }
  
  public func remove(_ product: Product) {
    self.basket.remove(product)
  }
  
  public func check(_ product: Product) -> Bool {
    self.basket.contains(product)
  }
}
