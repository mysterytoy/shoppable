
import SwiftUI

public struct AppView: View {
  let viewModel: AppViewModel
  
  public var body: some View {
    TabView {
      NavigationView {
        ProductsView(viewModel: viewModel)
      }
      .tabItem {
        Label("Products", systemImage: "square.grid.2x2")
      }
      
      NavigationView {
        BasketView(viewModel: viewModel)
      }
      .tabItem {
        Label("Basket", systemImage: "basket")
      }
    }
  }
  
  public init(viewModel: AppViewModel) {
    self.viewModel = viewModel
  }
}

struct AppView_Previews: PreviewProvider {
  static var previews: some View {
    AppView(
      viewModel: AppViewModel(
        productFetcher: .preview
      )
    )
  }
}
