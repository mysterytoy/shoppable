
import Product
import SwiftUI

struct ProductRow<Content: View>: View {
  let product: Product
  let image: (Product) -> UIImage?
  let content: Content
  
  init(
    _ product: Product,
    image: @escaping (Product) -> UIImage?,
    @ViewBuilder _ content: () -> Content
  ) {
    self.product = product
    self.image = image
    self.content = content()
  }
  
  var body: some View {
    HStack {
      if let image = self.image(product) {
        Image(uiImage: image)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: 100, height: 100)
      }
      else {
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
}

struct ProductRow_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      List {
        ProductRow(Product.examples[0], image: { _ in nil }) {
          Text("Button")
        }
      }
      .navigationTitle("Product Row")
    }
  }
}
