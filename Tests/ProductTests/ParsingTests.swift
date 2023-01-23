
import XCTest
@testable import Product

final class ParsingTests: XCTestCase {
  func testParse() throws {
    let products = try ProductParser.live.parse(testJSON)
    
    XCTAssertEqual(products, testProducts)
  }
  
  func testParse_unknownTypeError() throws {
    XCTAssertThrowsError(
      try ProductParser.live.parse(testJSON_unknownType)
    )
  }

  func testParse_chairMissingMaterialError() throws {
    XCTAssertThrowsError(
      try ProductParser.live.parse(testJSON_chairMissingMaterial)
    )
  }

  func testParse_couchMissingNumberOfSeatsError() throws {
    XCTAssertThrowsError(
      try ProductParser.live.parse(testJSON_couchMissingNumberOfSeats)
    )
  }
}
