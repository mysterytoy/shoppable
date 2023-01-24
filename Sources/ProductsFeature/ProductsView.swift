
import AppModel
import Product
import SwiftUI

public struct ProductsView: View {
  @ObservedObject var viewModel: ProductsViewModel
  
  private let spacing = 20.0
  
  public var body: some View {
    ScrollView {
      LazyVGrid(
        columns: [GridItem(.adaptive(minimum: 150), spacing: spacing)],
        spacing: spacing
      ) {
        ForEach(viewModel.products) { product in
          ProductCell(product) {
            Button(action: { viewModel.add(product) }) {
              Image(
                systemName: viewModel.check(product)
                ? "checkmark.circle.fill"
                : "plus.circle.fill"
              )
              .font(.title)
            }
            .disabled(viewModel.check(product))
          }
        }
      }
    }
    .navigationTitle("Products")
  }
  
  public init(viewModel: ProductsViewModel) {
    self.viewModel = viewModel
  }
}

struct ProductsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ProductsView(
        viewModel: ProductsViewModel(
          model: AppModel(
            productFetcher: .preview
          )
        )
      )
    }
  }
}
