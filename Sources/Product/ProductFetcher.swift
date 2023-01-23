
import Foundation

public struct ProductFetcher {
  public let fetch: () throws -> [Product]
  
  public init(fetch: @escaping () throws -> [Product]) {
    self.fetch = fetch
  }
}

extension ProductFetcher {
  public static var live = Self(
    fetch: {
      guard let productsPath = Bundle.main.path(forResource:"products", ofType: "json") else {
        throw "Failed to find path to products.json"
      }
      
      guard let productsData = FileManager.default.contents(atPath: productsPath) else {
        throw "Failed to produce data at path \(productsPath)"
      }
      
      return try ProductParser.live.parse(productsData)
    }
  )
  
  public static var stub = Self(
    fetch: {
      return Array()
    }
  )
}
