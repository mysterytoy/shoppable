
import Foundation
import Product

public class AppViewModel: ObservableObject {
  let products: [Product]

  @Published var basket: Set<Product>
  
  var total: Float {
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
  
  func add(_ product: Product) {
    self.basket.insert(product)
  }
}
