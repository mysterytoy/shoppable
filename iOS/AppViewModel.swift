
import Foundation
import Product

class AppViewModel: ObservableObject {
  let products: [Product]
  
  init(productFetcher: ProductFetcher) {
    do {
      self.products = try productFetcher.fetch()
    }
    catch {
      fatalError("Could not fetch products")
    }
  }
}
