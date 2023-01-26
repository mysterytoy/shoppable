
import XCTest

@testable import AppState
@testable import Product
@testable import ProductsFeature

final class ProductsViewModelTests: XCTestCase {
  func testViewModelCanAddProductToStateBasket() throws {
    let productToAdd = Product.examples[0]

    let appState = AppState(
      productFetcher: .stub,
      dataFetcher: .stub
    )
    
    let viewModel = ProductsViewModel(
      state: ProductsViewState(
        products: appState.products,
        selectedIDs: Set(appState.basket.map(\.id))
      ),
      delegate: appState
    )
    
    appState.addBasketObserver(
      observer: { products in
        viewModel.update(Set(products.map(\.id)))
      }
    )

    viewModel.add(productToAdd)

    XCTAssertTrue(appState.basket.contains(productToAdd))
    XCTAssertTrue(viewModel.state.selectedIDs.contains(productToAdd.id))
  }
  
  func testViewModelCanCheckStateBasketForProductID_basketContainsProduct() throws {
    let productToCheck = Product.examples[1]

    let appState = AppState(
      productFetcher: .stub,
      dataFetcher: .stub,
      basket: Product.examples
    )
    
    let viewModel = ProductsViewModel(
      state: ProductsViewState(
        products: appState.products,
        selectedIDs: Set(appState.basket.map(\.id))
      ),
      delegate: appState
    )

    XCTAssertTrue(viewModel.check(productToCheck))
  }

  func testViewModelCanCheckStateBasketForProductID_basketDoesNotContainProduct() throws {
    let productToCheck = Product.examples[1]

    let appState = AppState(
      productFetcher: .stub,
      dataFetcher: .stub,
      basket: [Product.examples[0]]
    )
    
    let viewModel = ProductsViewModel(
      state: ProductsViewState(
        products: appState.products,
        selectedIDs: Set(appState.basket.map(\.id))
      ),
      delegate: appState
    )

    XCTAssertFalse(viewModel.check(productToCheck))
  }
}

