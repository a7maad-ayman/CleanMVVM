//
//  NetworkBuilderRequest.swift
//  MovieApp
//
//  Created by ahmad on 06/07/2023.
//

import Foundation
class NetworkRequestBuilder {
  private var url: URL?
  private var method: HTTPMethod = .get
  
  func setURL(_ url: URL) -> Self {
    self.url = url
    return self
  }
  
  func setMethod(_ method: HTTPMethod) -> Self {
    self.method = method
    return self
  }
  
  func build() -> NetworkRequest {
    guard let url = url else {
      fatalError("URL must be set")
    }
    return NetworkRequest(url: url, method: method)
  }
}
