
import Product
import XCTest
@testable import Shoppable

final class AppModelTests: XCTestCase {
  func testAddProductAddsProductToBasket() throws {
    let productToAdd = Product.examples[0]
    
    let viewModel = AppModel(
      productFetcher: .stub
    )
    
    viewModel.add(productToAdd)
    
    XCTAssertTrue(viewModel.basket.contains(productToAdd))
  }
  
  func testRemoveProductRemovesProductFromBasket() throws {
    let productToRemove = Product.examples[0]
    let productToStay = Product.examples[1]
    
    let viewModel = AppModel(
      productFetcher: .stub,
      basket: Product.examples
    )
    
    viewModel.remove(productToRemove)
    
    XCTAssertTrue(viewModel.basket.contains(productToStay))
    XCTAssertFalse(viewModel.basket.contains(productToRemove))
  }
  
  func testTotalCalculatedFromSingleProduct() throws {
    let productToAdd = Product.examples[0]
    
    let viewModel = AppModel(
      productFetcher: .stub
    )
    
    viewModel.add(productToAdd)

    XCTAssertEqual(viewModel.total, productToAdd.price.value)
  }
  
  func testTotalCalculatedFromMultipleProducts() throws {
    let firstProduct = Product.examples[0]
    let secondProduct = Product.examples[1]
    
    let viewModel = AppModel(
      productFetcher: .stub
    )
    
    viewModel.add(firstProduct)
    viewModel.add(secondProduct)

    XCTAssertEqual(viewModel.total, firstProduct.price.value + secondProduct.price.value)
  }
  
  func testTotalReducedWhenProductsRemoved() throws {
    let productToRemove = Product.examples[0]
    let productToStay = Product.examples[1]
    
    let viewModel = AppModel(
      productFetcher: .stub,
      basket: Product.examples
    )
    
    XCTAssertEqual(viewModel.total, productToRemove.price.value + productToStay.price.value)
    
    viewModel.remove(productToRemove)
    
    XCTAssertEqual(viewModel.total, productToStay.price.value)
  }
  
  func testBasketContentsCanBeCheckedExternally_containsProduct() throws {
    let productToCheck = Product.examples[1]
    
    let viewModel = AppModel(
      productFetcher: .stub,
      basket: Product.examples
    )
    
    XCTAssertTrue(viewModel.check(productToCheck))
  }
  
  func testBasketContentsCanBeCheckedExternally_doesNotContainProduct() throws {
    let productToCheck = Product.examples[1]
    
    let viewModel = AppModel(
      productFetcher: .stub,
      basket: [Product.examples[0]]
    )
    
    XCTAssertFalse(viewModel.check(productToCheck))
  }
}
