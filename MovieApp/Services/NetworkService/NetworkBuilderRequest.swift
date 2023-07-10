import Foundation
class NetworkRequestBuilder {
  private var url: URL?
  private var method: HTTPMethod?
  private var queryParameters: [QueryParameterKey?: String] = [:]

  
  func setURL(_ url: URL) -> Self {
    self.url = url
    return self
  }
  
  func setMethod(_ method: HTTPMethod = .get) -> Self {
    self.method = method
    return self
  }
  
  func setQueryParameters(key: QueryParameterKey?, value: String) -> Self {
    self.queryParameters[key ?? nil] = value
    return self
  }
  
  private func buildURLWithQueryParameters() -> URL? {
    guard let url = url else {return nil}
    guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return nil}
  
    let queryItems = queryParameters.compactMap { URLQueryItem(name: $0.key?.rawValue ?? "", value: $0.value) }
    components.queryItems = queryItems

    return components.url
  }
  
  func build() -> URLRequest {
    guard let url = buildURLWithQueryParameters() else {
      fatalError("URL must be set")
    }
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = method?.rawValue
    return urlRequest
  }
}
