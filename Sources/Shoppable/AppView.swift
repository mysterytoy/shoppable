
import AppModel
import BasketFeature
import ProductsFeature
import SwiftUI

public struct AppView: View {
  let model: AppModel
  
  public var body: some View {
    TabView {
      NavigationView {
        ProductsView(
          viewModel: ProductsViewModel(
            model: model
          )
        )
      }
      .tabItem {
        Label("Products", systemImage: "square.grid.2x2")
      }
      
      NavigationView {
        BasketView(
          viewModel: BasketViewModel(
            model: model
          )
        )
      }
      .tabItem {
        Label("Basket", systemImage: "basket")
      }
    }
  }
  
  public init(model: AppModel) {
    self.model = model
  }
}

struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView(
      model: AppModel(
        productFetcher: .preview
      )
    )
  }
}
