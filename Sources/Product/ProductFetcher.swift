
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
  
  public static var preview = Self(
    fetch: {
      return [
        Product(
          id: "1",
          name: "Henriksdal",
          price: .init(currency: "kr", value: 499),
          info: .chair(material: "wood with cover", color: "white"),
          imageURL: URL(string: "https://shop.static.ingka.ikea.com/PIAimages/0462849_PE608354_S4.JPG")!
        ),
        Product(
          id: "2",
          name: "Lidhult",
          price: .init(currency: "kr", value: 1035),
          info: .couch(numberOfSeats: 4, color: "beige"),
          imageURL: URL(string: "https://shop.static.ingka.ikea.com/PIAimages/0667779_PE714073_S4.JPG")!
        ),
        Product(
          id: "5",
          name: "Odger",
          price: .init(currency: "kr", value: 695.20),
          info: .chair(material: "plastic", color: "dark blue"),
          imageURL: URL(string: "https://shop.static.ingka.ikea.com/PIAimages/0727322_PE735594_S4.JPG")!
        ),
        Product(
          id: "6",
          name: "Landskrona",
          price: .init(currency: "kr", value: 14396),
          info: .couch(numberOfSeats: 5, color: "black"),
          imageURL: URL(string: "https://shop.static.ingka.ikea.com/PIAimages/0630092_PE694645_S4.JPG")!
        )
      ]
    }
  )
}
