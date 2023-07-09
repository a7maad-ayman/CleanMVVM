import Foundation

class NetworkClient {
  private let session: URLSession
  
  init(session: URLSession = .shared) {
    self.session = session
  }
  
  func fetch<T:Decodable>(request: NetworkRequest, completion: @escaping (Result<T?, MAError>) -> Void) {
    var urlRequest = URLRequest(url: request.url)
    urlRequest.httpMethod = request.method.rawValue
    let task = session.dataTask(with: urlRequest) { data, response, error in
      if let _ = error {
        completion(.failure(.unableToComplete))
        print("Error")
      }
      guard let response = response as? HTTPURLResponse , response.statusCode == 200 else {
        completion(.failure(.invalidResponse))
        print("Response")
        return
      }
      
      guard let data else {
        completion(.failure(.invalidData))
        print("Data")
        return
      }
      
      do{
        let decoder = JSONDecoder()
        let movies = try decoder.decode(T.self, from: data)
        completion(.success(movies))
      } catch {
        completion(.failure(.invalidData))
        print("decode")
      }
    }
    task.resume()
  }
}
