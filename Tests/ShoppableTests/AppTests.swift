
import XCTest

@testable import AppState
@testable import BasketFeature
@testable import Product
@testable import ProductsFeature
@testable import Shoppable

final class AppTests: XCTestCase {
  func testProductsShown() throws {
    let appRoot = AppRoot(
      appState: AppState(
        productFetcher: .init(
          fetch: {
            Product.examples
          }
        )
      )
    )
    
    XCTAssertEqual(appRoot.appState.products, Product.examples)
    XCTAssertEqual(appRoot.productsViewModel.state.products, Product.examples)
  }
  
  func testAddProduct() throws {
    let productToAdd = Product.examples[1]

    let appRoot = AppRoot(
      appState: AppState(
        productFetcher: .stub
      )
    )
    
    appRoot.productsViewModel.add(productToAdd)

    XCTAssertEqual(appRoot.appState.basket, Set([productToAdd]))
    XCTAssertEqual(appRoot.basketViewModel.state.basket, Set([productToAdd]))
  }
  
  func testRemoveProduct() throws {
    let productToRemove = Product.examples[0]
    let productToStay = Product.examples[1]

    let appRoot = AppRoot(
      appState: AppState(
        productFetcher: .stub,
        basket: Product.examples
      )
    )
    
    appRoot.basketViewModel.remove(productToRemove)

    XCTAssertTrue(appRoot.appState.basket.contains(productToStay))
    XCTAssertFalse(appRoot.appState.basket.contains(productToRemove))
    
    XCTAssertTrue(appRoot.basketViewModel.state.basket.contains(productToStay))
    XCTAssertFalse(appRoot.basketViewModel.state.basket.contains(productToRemove))
  }
  
  func testEndToEnd() throws {
    let firstProduct = Product.examples[0]
    let secondProduct = Product.examples[1]
    
    let appRoot = AppRoot(
      appState: AppState(
        productFetcher: .init(
          fetch: {
            Product.examples
          }
        )
      )
    )
    
    XCTAssertEqual(appRoot.productsViewModel.state.products, Product.examples)
    
    appRoot.productsViewModel.add(firstProduct)
    
    XCTAssertEqual(appRoot.basketViewModel.state.basket, Set([firstProduct]))
    XCTAssertEqual(appRoot.basketViewModel.total, firstProduct.price.value)
    
    appRoot.productsViewModel.add(secondProduct)
    
    XCTAssertEqual(appRoot.basketViewModel.state.basket, Set(Product.examples))
    XCTAssertEqual(appRoot.basketViewModel.total, firstProduct.price.value + secondProduct.price.value)
    
    appRoot.basketViewModel.remove(firstProduct)
    
    XCTAssertEqual(appRoot.basketViewModel.state.basket, Set([secondProduct]))
    XCTAssertEqual(appRoot.basketViewModel.total, secondProduct.price.value)
    
    appRoot.basketViewModel.remove(secondProduct)
    
    XCTAssertEqual(appRoot.basketViewModel.state.basket, Set())
    XCTAssertEqual(appRoot.basketViewModel.total, 0.0)
  }
}
