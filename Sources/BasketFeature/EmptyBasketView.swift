
import SwiftUI

struct EmptyBasketView: View {
  var body: some View {
    VStack {
      Text("Your basket is empty")
      Image(systemName: "basket")
        .padding()
      Text("Time to shop!")
    }
    .font(.title)
    .foregroundColor(.secondary)
  }
}

struct EmptyBasketView_Previews: PreviewProvider {
  static var previews: some View {
    EmptyBasketView()
  }
}
