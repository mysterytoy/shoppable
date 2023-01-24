
import Product
import SwiftUI

struct ProductCell<Content: View>: View {
  let product: Product
  let content: Content
  
  init(_ product: Product, @ViewBuilder _ content: () -> Content) {
    self.product = product
    self.content = content()
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      ZStack(alignment: .bottomTrailing) {
        AsyncImage(url: product.imageURL) { image in
          image.resizable()
            .aspectRatio(contentMode: .fill)
        } placeholder: {
          ProgressView()
        }
        .frame(width: 150, height: 150)
        
        content
      }
      
      VStack(alignment: .leading) {
        Text(product.name)
          .font(.headline)
        Text(product.info.description)
          .font(.subheadline)
          .foregroundColor(.secondary)
      }
    }
  }
}

struct ProductCell_Previews: PreviewProvider {
  static var previews: some View {
    ScrollView {
      ForEach(Product.examples) { product in
        ProductCell(product) {
          Image(systemName: "circle")
        }
      }
    }
  }
}
