
import XCTest
@testable import Product

final class ProductTests: XCTestCase {
  func testCouchDescription() throws {
    let couch = Product.Info.couch(numberOfSeats: 7, color: "white")
    
    XCTAssertEqual(couch.description, "Seats 7, white")
  }
  
  func testChairDescription() throws {
    let chair = Product.Info.chair(material: "leather", color: "black")
    
    XCTAssertEqual(chair.description, "Leather, black")
  }
}
