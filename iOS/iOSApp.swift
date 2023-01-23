
import SwiftUI
import Product

@main
struct iOSApp: App {
  var body: some Scene {
    WindowGroup {
      ProductsView(
        viewModel: AppViewModel(
          productFetcher: .live
        )
      )
    }
  }
}
