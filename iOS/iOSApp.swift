
import AppModel
import SwiftUI
import Shoppable

@main
struct iOSApp: App {
  var body: some Scene {
    WindowGroup {
      AppView(
        model: AppModel(
          productFetcher: .live
        )
      )
    }
  }
}
