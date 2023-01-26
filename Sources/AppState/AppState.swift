
import BasketFeature
import Foundation
import Product
import ProductsFeature
import UIKit

public class AppState: ProductsViewModelDelegate, BasketViewModelDelegate {
  public let products: [Product]
  
  public var basket: Set<Product> {
    didSet {
      self.basketObservers.forEach { observer in
        observer(basket)
      }
    }
  }
  
  public var images: [String : UIImage?] {
    didSet {
      self.imageObservers.forEach { observer in
        observer(images)
      }
    }
  }
  
  var basketObservers: [(Set<Product>) -> Void] = Array()
  var imageObservers: [([String : UIImage?]) -> Void] = Array()
  
  public init(productFetcher: ProductFetcher, dataFetcher: DataFetcher, basket: [Product] = Array()) {
    do {
      self.products = try productFetcher.fetch()
      self.basket = Set(basket)
      self.images = Dictionary()
      
      Task {
        try await self.requestProductImages(with: dataFetcher)
      }
    }
    catch {
      fatalError("Could not fetch products")
    }
  }
  
  public func addObserver(observer: @escaping (Set<Product>) -> Void) {
    self.basketObservers.append(observer)
  }
  
  public func addObserver(observer: @escaping ([String : UIImage?]) -> Void) {
    self.imageObservers.append(observer)
  }

  public func add(_ product: Product) {
    self.basket.insert(product)
  }
  
  public func remove(_ product: Product) {
    self.basket.remove(product)
  }
  
  @MainActor
  private func requestProductImages(with dataFetcher: DataFetcher) async throws {
    try await withThrowingTaskGroup(of: (String, UIImage?).self) { group in
      let ids = products.map(\.id)
      let urls = products.map(\.imageURL)
      let imageRequests = zip(ids, urls)
      
      for (id, url) in imageRequests {
        group.addTask {
          async let imageData = dataFetcher.fetch(url)
          let image = try await UIImage(data: imageData)
          
          return (id, image)
        }
      }
      
      for try await (name, image) in group {
        if let image {
          images[name] = image
        }
      }
    }
  }
}
