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
    private var headers: [String: String] = [:]
    private var parameters: [String: Any] = [:]
    
    func setURL(_ url: URL) -> Self {
        self.url = url
        return self
    }
    
    func setMethod(_ method: HTTPMethod) -> Self {
        self.method = method
        return self
    }
    
    func setHeaders(_ headers: [String: String]) -> Self {
        self.headers = headers
        return self
    }
    
    func setParameters(_ parameters: [String: Any]) -> Self {
        self.parameters = parameters
        return self
    }
    
    func build() -> NetworkRequest {
        guard let url = url else {
            fatalError("URL must be set")
        }
        return NetworkRequest(url: url, method: method, headers: headers, parameters: parameters)
    }
}
