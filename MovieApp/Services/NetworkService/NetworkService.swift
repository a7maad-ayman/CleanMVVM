import Foundation

class NetworkService {
  private let session: URLSession
  
  init(session: URLSession = .shared) {
    self.session = session
  }
  
  func fetch<T:Decodable>(request: URLRequest, completion: @escaping (Result<T?, MAError>) -> Void) {
    
    let task = session.dataTask(with: request ) { data, response, error in
      if let _ = error {
        completion(.failure(.unableToComplete))
      }
      guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
        completion(.failure(.invalidResponse))
        return
      }
      
      guard let data else {
        completion(.failure(.invalidData))
        return
      }
      
      do{
        let decoder = JSONDecoder()
        let movies = try decoder.decode(T.self, from: data)
        completion(.success(movies))
      } catch {
        completion(.failure(.invalidData))
      }
    }
    task.resume()
  }
}
