
import Product
import SwiftUI

struct ProductsView: View {
  @ObservedObject var viewModel: AppViewModel
  
  var body: some View {
    List {
      ForEach(viewModel.products) { product in
        HStack {
          AsyncImage(url: product.imageURL) { image in
            image.resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 100, height: 100)
            } placeholder: {
              ProgressView()
                .frame(width: 100, height: 100)
            }

          VStack(alignment: .leading) {
            Text(product.name)
              .font(.headline)
            Text(product.info.description)
              .font(.subheadline)
              .foregroundColor(.secondary)
          }
          Spacer()
          Button(action: { viewModel.add(product) }) {
            Text("Add")
          }
        }
      }
    }
    .navigationTitle("Products")
  }
}

struct ProductsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ProductsView(
        viewModel: AppViewModel(
          productFetcher: .preview
        )
      )
    }
  }
}
