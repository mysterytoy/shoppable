
import Foundation

struct Price: Decodable, Equatable {
  let currency: String
  let value: Float
}

struct Info: Decodable, Equatable {
  let color: String
  let material: String?
  let numberOfSeats: Int?
}

struct Product: Decodable {
  let id: String
  let name: String
  let price: Price
  let info: Info
  let type: String
  let imageUrl: URL
}

struct Products: Decodable {
  let products: [Product]
}
