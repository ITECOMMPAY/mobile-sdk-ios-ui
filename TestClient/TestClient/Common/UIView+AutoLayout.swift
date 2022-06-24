//
//  UIView+AutoLayout.swift
//  TestClient
//
//  Created by Виталий Морозов on 02.02.2021.
//  Copyright © 2021 Ecommpay. All rights reserved.
//

import UIKit

protocol AutoLayoutPrepareable {
    @discardableResult func setupAutoLayout() -> Self
}

extension UIView: AutoLayoutPrepareable { }

extension AutoLayoutPrepareable where Self: UIView {
    
    @discardableResult func setupAutoLayout() -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
}

extension Array where Element == UIView {
    
    func setupAutoLayout() {
        for element in self {
            element.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
}
