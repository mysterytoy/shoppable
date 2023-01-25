
import AppState
import BasketFeature
import ProductsFeature
import SwiftUI

public class AppRoot {
  let appState: AppState
  public let productsViewModel: ProductsViewModel
  public let basketViewModel: BasketViewModel
  
  public init(appState: AppState) {
    self.appState = appState
    
    self.productsViewModel = ProductsViewModel(
      state: ProductsViewState(
        products: appState.products,
        selectedIDs: Set(appState.basket.map(\.id))
      ),
      delegate: appState
    )
    
    self.basketViewModel = BasketViewModel(
      state: BasketViewState(
        basket: appState.basket
      ),
      delegate: appState
    )
    
    self.appState.addObserver(
      observer: { [weak self] products in
        self?.productsViewModel.update(Set(products.map(\.id)))
      }
    )
    
    self.appState.addObserver(
      observer: { [weak self] products in
        self?.basketViewModel.update(products)
      }
    )
  }
}

