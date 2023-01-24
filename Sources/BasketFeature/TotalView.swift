
import SwiftUI

struct TotalView: View {
  let total: Float
    
  var body: some View {
    VStack {
      Text("Total")
        .font(.headline)
      
      Text(String(format: "%.2f", total))
        .font(.subheadline)
        .foregroundColor(.secondary)
    }
    .padding()
    .background(Color("totalColor"))
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
