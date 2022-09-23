//
//  UIViewExtension.swift
//  MyBoxer
//
//  Created by Sebastian Hajduk on 23/09/2022.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}
