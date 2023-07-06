import UIKit

final class NetworkService {
  static let shared = NetworkService()
  let cache = NSCache<NSString,UIImage> ()
  private init(){}
  //TODO: note [aziz]: refactor end points handling to a more efficient way, for example: network router
  func fetch<T:Decodable>(from url: String ,completion: @escaping (Result<T?,MAError>) -> Void ) {
    
    guard let url = URL(string: url) else {
      completion(.failure(.invalidURL))
      return
    }
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
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
        print(error.localizedDescription)
      }
    }
    task.resume()
  }
}



//MARK: Network layer depend on builder pattern
class NetworkClient {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetch<T:Decodable>(request: NetworkRequest, completion: @escaping (Result<T?, Error>) -> Void) {
        var urlComponents = URLComponents(url: request.url, resolvingAgainstBaseURL: false)!
        urlComponents.queryItems = request.parameters.map { URLQueryItem(name: $0.key, value: String(describing: $0.value)) }
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            } else {
              completion(.success(data as? T))
            }
        }
        task.resume()
    }
}
