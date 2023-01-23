
import Foundation

struct ProductParser {
  let parse: (Data) throws -> [Product]
}

extension ProductParser {
  static var live = Self(
    parse: { data in
      return try JSONDecoder()
        .decode(ProductsStorage.self, from: data)
        .products
        .map(Product.init)
    }
  )
}
