import UIKit

final class NetworkService {
    static let shared = NetworkService()
    let cache = NSCache<NSString,UIImage> ()
    private init(){}
  // note [aziz]: refactor to a generic method to work with any decodable model
  // note [aziz]: refactor end points handling to a more efficient way, for example: network router
  //fetch<T:Decodable> (url:String? , compiletionHandler:@escaping (T?)->Void )
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
