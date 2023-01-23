
import Foundation

struct InfoStorage: Decodable, Equatable {
  let color: String
  let material: String?
  let numberOfSeats: Int?
}

struct ProductStorage: Decodable, Equatable {
  let id: String
  let name: String
  let price: Product.Price
  let info: InfoStorage
  let type: String
  let imageUrl: URL
}

struct ProductsStorage: Decodable, Equatable {
  let products: [ProductStorage]
}

extension Product {
  init(storage: ProductStorage) throws {
    self.id = storage.id
    self.name = storage.name
    self.price = storage.price
    self.imageURL = storage.imageUrl
    do {
      self.info = try Product.Info(storage)
    }
    catch {
      throw error
    }
  }
}
