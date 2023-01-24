
import Product
import XCTest
@testable import Shoppable

final class AppViewModelTests: XCTestCase {
  func testAddProductAddsProductToBasket() throws {
    let productToAdd = Product.examples[0]
    
    let viewModel = AppViewModel(
      productFetcher: .stub
    )
    
    viewModel.add(productToAdd)
    
    XCTAssertTrue(viewModel.basket.contains(productToAdd))
  }
  
  func testRemoveProductRemovesProductFromBasket() throws {
    let productToRemove = Product.examples[0]
    let productToStay = Product.examples[1]
    
    let viewModel = AppViewModel(
      productFetcher: .stub,
      basket: Product.examples
    )
    
    viewModel.remove(productToRemove)
    
    XCTAssertTrue(viewModel.basket.contains(productToStay))
    XCTAssertFalse(viewModel.basket.contains(productToRemove))
  }
  
  func testTotalCalculatedFromSingleProduct() throws {
    let productToAdd = Product.examples[0]
    
    let viewModel = AppViewModel(
      productFetcher: .stub
    )
    
    viewModel.add(productToAdd)

    XCTAssertEqual(viewModel.total, productToAdd.price.value)
  }
  
  func testTotalCalculatedFromMultipleProducts() throws {
    let firstProduct = Product.examples[0]
    let secondProduct = Product.examples[1]
    
    let viewModel = AppViewModel(
      productFetcher: .stub
    )
    
    viewModel.add(firstProduct)
    viewModel.add(secondProduct)

    XCTAssertEqual(viewModel.total, firstProduct.price.value + secondProduct.price.value)
  }
}
