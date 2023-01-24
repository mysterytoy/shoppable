
import Product
import SwiftUI

struct BasketView: View {
  @ObservedObject var viewModel: AppViewModel
  
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    ZStack {
      List(Array(viewModel.basket)) { product in
        HStack {
          VStack(alignment: .leading) {
            Text(product.name)
              .font(.headline)
            Text(product.price.description)
              .font(.subheadline)
              .foregroundColor(.secondary)
          }
          Spacer()
          Button(action: { viewModel.remove(product) }) {
            Text("Remove")
              .foregroundColor(.red)
          }
        }
      }
      VStack {
        Spacer()
        VStack {
          Text("Total")
            .font(.headline)
          Text("\(viewModel.total)")
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
        .padding()
        .background(
          colorScheme == .dark
            ? Color.white.opacity(0.2)
            : Color.white
        )
        .cornerRadius(10)
        .overlay(
          RoundedRectangle(cornerRadius: 10)
            .stroke(
              Color.black.opacity(0.1),
              lineWidth: 1
            )
        )
        .padding()
      }
    }
    .navigationTitle("Basket")
  }
}

struct BasketView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      BasketView(
        viewModel: AppViewModel(
          productFetcher: .preview,
          basket: Product.examples
        )
      )
    }
  }
}
