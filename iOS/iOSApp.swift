
import SwiftUI
import Shoppable

@main
struct iOSApp: App {
  var body: some Scene {
    WindowGroup {
      AppView(
        viewModel: AppViewModel(
          productFetcher: .live
        )
      )
    }
  }
}
