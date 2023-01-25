
import XCTest
@testable import Product

final class ProductTests: XCTestCase {
  func testPriceDescriptoin() throws {
    let price = Product.Price(currency: "gbp", value: 100)
    
    XCTAssertEqual(price.description, "100.00 gbp")
  }
  
  func testCouchDescription() throws {
    let couch = Product.Info.couch(numberOfSeats: 7, color: "white")
    
    XCTAssertEqual(couch.description, "Seats 7, white")
  }
  
  func testChairDescription() throws {
    let chair = Product.Info.chair(material: "leather", color: "black")
    
    XCTAssertEqual(chair.description, "Leather, black")
  }
}
