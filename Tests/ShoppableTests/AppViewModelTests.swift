
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
    
    XCTAssert(viewModel.basket.contains(productToAdd))
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
