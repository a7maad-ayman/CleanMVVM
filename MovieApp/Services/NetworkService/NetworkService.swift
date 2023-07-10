import Foundation
import Combine

final class NetworkService {
  private let session: URLSession
  
  init(session: URLSession = .shared) {
    self.session = session
  }
  
  func fetch<T: Decodable>(request: URLRequest) -> AnyPublisher<T?, MAError> {
    return session.dataTaskPublisher(for: request)
      .tryMap { data, response in
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
          throw MAError.invalidResponse
        }
        return data
      }
      .decode(type: T?.self, decoder: JSONDecoder())
      .mapError { error in
        if let error = error as? MAError {
          return error
        } else {
          return MAError.invalidData
        }
      }
      .eraseToAnyPublisher()
  }
}
