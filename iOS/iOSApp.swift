
import AppState
import SwiftUI
import Shoppable

@main
struct iOSApp: App {
  var body: some Scene {
    WindowGroup {
      AppView(
        appRoot: AppRoot(
          appState: AppState(
            productFetcher: .live
          )
        )
      )
    }
  }
}
