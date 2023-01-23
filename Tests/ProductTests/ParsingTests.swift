
import XCTest
@testable import Product

final class ParsingTests: XCTestCase {
  func testParse() throws {
    let products = try JSONDecoder()
      .decode(ProductsStorage.self, from: testJSON)
      .products
      .map(Product.init)
    
    XCTAssertEqual(products, testProducts)
  }
  
  func testParse_unknownTypeError() throws {
    XCTAssertThrowsError(
      try JSONDecoder()
        .decode(ProductsStorage.self, from: testJSON_unknownType)
        .products
        .map(Product.init)
    )
  }

  func testParse_chairMissingMaterialError() throws {
    XCTAssertThrowsError(
      try JSONDecoder()
        .decode(ProductsStorage.self, from: testJSON_chairMissingMaterial)
        .products
        .map(Product.init)
    )
  }

  func testParse_couchMissingNumberOfSeatsError() throws {
    XCTAssertThrowsError(
      try JSONDecoder()
        .decode(ProductsStorage.self, from: testJSON_couchMissingNumberOfSeats)
        .products
        .map(Product.init)
    )
  }
}
