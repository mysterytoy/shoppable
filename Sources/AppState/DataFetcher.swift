
import Foundation

public struct DataFetcher {
  public let fetch: (URL) async throws -> Data
}

extension DataFetcher {
  public static let live = DataFetcher { url in
    let (data, _) = try await URLSession.shared.data(from: url)
    return data
  }
  
  public static let stub = DataFetcher { url in
    return Data()
  }
}
