//
//  ErrorMessages.swift
//  MovieApp
//
//  Created by ahmad on 04/07/2023.
//

import Foundation

enum MAError: String, Error {
    case invalidURL = "This Url is invalid"
    case unableToComplete = "Unable to complete your request.Please check your internet connection"
    case invalidResponse = "Invalid response form the server. Please try again"
    case invalidData = "The data received from the server was invalid. Please try again"
}
