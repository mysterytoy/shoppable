
import AppState
import BasketFeature
import ProductsFeature
import SwiftUI

public struct AppView: View {
  let appRoot: AppRoot
  
  public var body: some View {
    TabView {
      NavigationView {
        ProductsView(
          viewModel: appRoot.productsViewModel
        )
      }
      .navigationViewStyle(.stack)
      .tabItem {
        Label("Products", systemImage: "square.grid.2x2")
      }
      
      NavigationView {
        BasketView(
          viewModel: appRoot.basketViewModel
        )
      }
      .navigationViewStyle(.stack)
      .tabItem {
        Label("Basket", systemImage: "basket")
      }
    }
  }
  
  public init(appRoot: AppRoot) {
    self.appRoot = appRoot
  }
}

struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView(
      appRoot: AppRoot(
        appState: AppState(
          productFetcher: .preview
        )
      )
    )
  }
}
