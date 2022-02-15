//
//  UIView+Material.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/02/13.
//

import UIKit

protocol MaterialView {
    func elevate(elevation: Double)
}

extension UIView: MaterialView {

    func elevate(elevation: Double) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: elevation)
        layer.shadowRadius = abs(CGFloat(elevation))
        layer.shadowOpacity = 0.24
    }

}
