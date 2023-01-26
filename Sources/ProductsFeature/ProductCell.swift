
import Product
import SwiftUI
import UIKit

struct ProductCell<Content: View>: View {
  let product: Product
  let image: (Product) -> UIImage?
  let content: Content
  
  init(
    _ product: Product,
    image: @escaping (Product) -> UIImage?,
    @ViewBuilder _ content: () -> Content
  ) {
    self.product = product
    self.content = content()
    self.image = image
  }
  
  var body: some View {
    VStack(alignment: .leading) {
      ZStack(alignment: .bottomTrailing) {
        if let image = self.image(product) {
          Image(uiImage: image)
            .resizable()
            .scaledToFill()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 150)
        }
        else {
          ProgressView()
            .frame(width: 150, height: 150)
        }
        
        content
      }
        
      Text(product.name)
        .font(.headline)
      
      Text(product.info.description)
        .font(.subheadline)
        .foregroundColor(.secondary)
    
      Spacer()
    }
  }
}

struct ProductCell_Previews: PreviewProvider {
  static var previews: some View {
    ScrollView {
      ForEach(Product.examples) { product in
        ProductCell(product, image: { _ in nil }) {
          Image(systemName: "circle")
        }
      }
    }
  }
}
