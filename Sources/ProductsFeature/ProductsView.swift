
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
        ForEach(viewModel.state.products) { product in
          ProductCell(product) {
            Button(action: { viewModel.add(product) }) {
              Image(
                systemName: viewModel.check(product)
                ? "checkmark.circle.fill"
                : "plus.circle.fill"
              )
              .font(.title)
            }
            .accessibilityValue(
              viewModel.check(product)
              ? "In your basket"
              : "Double tap to add to your basket"
            )
            .disabled(viewModel.check(product))
          }
          .accessibilityElement(children: .combine)
        }
      }
      .padding(spacing)
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
          state: ProductsViewState(
            products: Product.examples,
            selectedIDs: Set([Product.examples[0].id])
          ),
          delegate: PreviewModelDelegate()
        )
      )
    }
  }
  
  private class PreviewModelDelegate: ProductsViewModelDelegate {
    func add(_ product: Product) {}
  }
}
