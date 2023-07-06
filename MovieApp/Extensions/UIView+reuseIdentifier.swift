//
//  UIView+reusedIdentifer.swift
//  MovieApp
//
//  Created by ahmad on 06/07/2023.
//

import UIKit
extension UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
