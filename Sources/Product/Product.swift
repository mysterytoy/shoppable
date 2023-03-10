
import Foundation

public struct Product: Identifiable, Equatable, Hashable {
  public let id: String
  public let name: String
  public let price: Price
  public let info: Info
  public let imageURL: URL
  
  public func hash(into hasher: inout Hasher) {
    hasher.combine(id)
    hasher.combine(name)
  }
}

extension Product {
  public struct Price: Decodable, Equatable {
    public let currency: String
    public let value: Float
    
    public var description: String {
      String(format: "%.2f \(currency)", value) 
    }
  }
  
  public enum Info: Equatable {
    case couch(numberOfSeats: Int, color: String)
    case chair(material: String, color: String)
    
    public var description: String {
      switch self {
      case let .couch(numberOfSeats, color):
        return "Seats \(numberOfSeats), \(color)"
      case let .chair(material, color):
        return "\(material.capitalized), \(color)"
      }
    }
  }
}

extension Product {
  public static let examples = [
    Self(
      id: "ny",
      name: "Any",
      price: .init(currency: "kr", value: 50.0),
      info: .couch(numberOfSeats: 3, color: "any"),
      imageURL: URL(string: "https://example.com")!
    ),
    Self(
      id: "other",
      name: "Other",
      price: .init(currency: "kr", value: 25.0),
      info: .chair(material: "other", color: "other"),
      imageURL: URL(string: "https://example.com")!
    )
  ]
}

extension Product.Info {
  init(_ storage: ProductStorage) throws {
    if storage.type == "chair" {
      if let material = storage.info.material {
        self = .chair(
          material: material,
          color: storage.info.color
        )
      }
      else {
        throw "Parsing failed due to missing material on chair"
      }
    }
    else if storage.type == "couch" {
      if let numberOfSeats = storage.info.numberOfSeats {
        self = .couch(
          numberOfSeats: numberOfSeats,
          color: storage.info.color
        )
      }
      else {
        throw "Parsing failed due to missing number of seats on couch"
      }
    }
    else {
      throw "Parsing failed due to unknown type"
    }
  }
}

extension String: LocalizedError {
  public var errorDescription: String? { return self }
}
