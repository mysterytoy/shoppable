
import SwiftUI

struct TotalView: View {
  let total: Float
  
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    VStack {
      Text("Total")
        .font(.headline)
      Text("\(total)")
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
  
  init(total: Float) {
    self.total = total
  }
}

struct TotalView_Previews: PreviewProvider {
  static var previews: some View {
    TotalView(total: 499.99)
  }
}
