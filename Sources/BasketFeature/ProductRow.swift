
import Product
import SwiftUI

struct ProductRow<Content: View>: View {
  let product: Product
  let content: Content
  
  var body: some View {
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
        Text(product.price.description)
          .font(.subheadline)
          .foregroundColor(.secondary)
      }
      
      Spacer()
      
      content
    }
  }
  
  init(_ product: Product, @ViewBuilder _ content: () -> Content) {
    self.product = product
    self.content = content()
  }
}

struct ProductRow_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      List {
        ProductRow(Product.examples[0]) {
          Text("Button")
        }
      }
      .navigationTitle("Product Row")
    }
  }
}
