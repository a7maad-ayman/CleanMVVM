//
//  NetworkBuilderRequest.swift
//  MovieApp
//
//  Created by ahmad on 06/07/2023.
//

import Foundation
class NetworkRequestBuilder {
  private var url: URL?
  private var method: HTTPMethod?
  private var queryParameters: [String: String] = [:]

  
  func setURL(_ url: URL) -> Self {
    self.url = url
    return self
  }
  
  func setMethod(_ method: HTTPMethod = .get) -> Self {
    self.method = method
    return self
  }
  
  func setQueryParameters(_ parameters: [String: String]) -> Self {
    self.queryParameters = parameters
    return self
  }
  
  private func buildURLWithQueryParameters() -> URL? {
    guard let url = url else {return nil}
    guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else { return nil}
  
    let queryItems = queryParameters.map { URLQueryItem(name: $0.key, value: $0.value) }
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
