
import XCTest

@testable import AppState
@testable import Product
@testable import BasketFeature

final class BasketViewModelTests: XCTestCase {
  func testViewModelTotalIsZeroByDefault() throws {
    let appState = AppState(
      productFetcher: .stub
    )
    
    let viewModel = BasketViewModel(
      state: BasketViewState(
        basket: appState.basket
      ),
      delegate: appState
    )
    
    XCTAssertEqual(viewModel.total, 0.0)
  }
  
  func testViewModelCanRemoveProductFromStateBasket() throws {
    let productToRemove = Product.examples[0]
    let productToStay = Product.examples[1]

    let appState = AppState(
      productFetcher: .stub,
      basket: Product.examples
    )
    
    let viewModel = BasketViewModel(
      state: BasketViewState(
        basket: appState.basket
      ),
      delegate: appState
    )

    viewModel.remove(productToRemove)

    XCTAssertTrue(appState.basket.contains(productToStay))
    XCTAssertFalse(appState.basket.contains(productToRemove))
  }

  func testViewModelTotalCalculatedFromSingleProduct() throws {
    let productInBasket = Product.examples[0]
    
    let appState = AppState(
      productFetcher: .stub,
      basket: [productInBasket]
    )

    let viewModel = BasketViewModel(
      state: BasketViewState(
        basket: appState.basket
      ),
      delegate: appState
    )

    XCTAssertEqual(viewModel.total, productInBasket.price.value)
  }

  func testViewModelTotalCalculatedFromMultipleProducts() throws {
    let firstProduct = Product.examples[0]
    let secondProduct = Product.examples[1]

    let appState = AppState(
      productFetcher: .stub,
      basket: Product.examples
    )

    let viewModel = BasketViewModel(
      state: BasketViewState(
        basket: appState.basket
      ),
      delegate: appState
    )

    XCTAssertEqual(viewModel.total, firstProduct.price.value + secondProduct.price.value)
  }

  func testViewModelTotalReducedWhenProductsRemoved() throws {
    let productToRemove = Product.examples[0]
    let productToStay = Product.examples[1]

    let appState = AppState(
      productFetcher: .stub,
      basket: Product.examples
    )
    
    let viewModel = BasketViewModel(
      state: BasketViewState(
        basket: appState.basket
      ),
      delegate: appState
    )
    
    appState.addObserver(
      observer: { products in
        viewModel.update(products)
      }
    )

    XCTAssertEqual(viewModel.total, productToRemove.price.value + productToStay.price.value)

    viewModel.remove(productToRemove)

    XCTAssertEqual(viewModel.total, productToStay.price.value)
  }
}
