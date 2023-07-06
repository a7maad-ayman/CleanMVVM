//
//  NetworkRequest.swift
//  MovieApp
//
//  Created by ahmad on 06/07/2023.
//

import Foundation

struct NetworkRequest {
    let url: URL
    let method: HTTPMethod
    let headers: [String: String]
    let parameters: [String: Any]
}
