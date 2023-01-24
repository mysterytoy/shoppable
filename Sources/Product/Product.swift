
import Foundation

public struct Product: Identifiable {
  public let id: String
  public let name: String
  public let price: Price
  public let info: Info
  public let imageURL: URL
}

extension Product: Equatable {
  public struct Price: Decodable, Equatable {
    public let currency: String
    public let value: Float
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
