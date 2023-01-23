
import XCTest
@testable import ProductFetcher

final class ParsingTests: XCTestCase {
  func testParsing() throws {
    let products = try JSONDecoder()
      .decode(Products.self, from: testJSON)
      .products
    
    XCTAssertEqual(products[0].id, "1")
    XCTAssertEqual(products[0].name, "Henriksdal")
    XCTAssertEqual(products[0].price, Price(currency: "kr", value: 499))
    XCTAssertEqual(products[0].info, Info(color: "white", material: "wood with cover", numberOfSeats: nil))
    XCTAssertEqual(products[0].type, "chair")
    XCTAssertEqual(products[0].imageUrl, URL(string: "https://shop.static.ingka.ikea.com/PIAimages/0462849_PE608354_S4.JPG")!)
    
    XCTAssertEqual(products[1].id, "2")
    XCTAssertEqual(products[1].name, "Lidhult")
    XCTAssertEqual(products[1].price, Price(currency: "kr", value: 1035))
    XCTAssertEqual(products[1].info, Info(color: "beige", material: nil, numberOfSeats: 4))
    XCTAssertEqual(products[1].type, "couch")
    XCTAssertEqual(products[1].imageUrl, URL(string: "https://shop.static.ingka.ikea.com/PIAimages/0667779_PE714073_S4.JPG")!)
  }
}
