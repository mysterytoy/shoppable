# Shoppable

IKEA Assignment, showcasing an app with a list of products that can be added and removed from a basket that displays total price. The app is written using SwiftUI and split into feature modules.

* [Quick Run](#quick-run)
* [Project Structure](#project-structure)
* [Testing](#testing)
* [Async Image](#async-image)
* [Accessibility](#accessibility)

## Quick Run

Open `Shoppable.xcworkspace`, make sure the iOS scheme is selected, and hit build!

## Project Structure

At the root of the repo are `Sources/` and `Tests/` which are home to all views, models, and unit tests. Also at the top level are an Xcode project containing a single app target called `iOS`, and an Xcode workspace that is used to house and develop both the package and the project at once.

### Shoppable Package

Shoppable is split into feature-based modules using libraries within a Swift package. The whole repo is vended as a Swift package. The libraries within the package include:

* `Shoppable` containing the root view and bootstrapping of the application
* `AppState` which represents the top-level shared state between features
* `ProductsFeature` containing the view, view model, and state for the screen that lists all products
* `BasketFeature` containing the view, view model, and state for the screen that manages the basket
* `Product` which is home to the shared type of the same name and the logic for parsing it from JSON

### Shoppable Project

The project contents can be found in the `iOS/` directory. The project contains only the bare minimum to run a SwiftUI application. It depends directly on the `Shoppable` library which itself brings in all other necessary feature libraries and bootstraps the features. The project is relegated to only constructing the bootstrapper and passing it a new `AppState` with a `ProductFetcher` dependency.

The application is not designed to be built from the project alone, so please use the workspace to open in Xcode and build.

## Testing

The `Shoppable`, `ProductsFeature`, `BasketFeature` and `Product` libraries all have corresponding unit test suites.  These can be run individually from the test schemes themselves or they can be run all at once from the `iOS` scheme.

## Async Image

The image requests in both the products grid of the `ProductsFeature` and the basket list of the `BasketFeature` are handled automatically by SwiftUI's `AsyncImage` view. This feels like the correct approach for this task because the only requirement is a valud `URL` type and we have one guaranteed after succesfully parsing a `Product`.

However, this means there is no need for any custom network requests in the app, and so to demonstrate my capability there is an `image-fetching` branch which uses async/await to load the images once and supply to them to both features.

## Accessibility

The app has been tested using VoiceOver and both `ProductsFeature` and `BasketFeature` have been adjusted to make this a smoother experience than the default.
