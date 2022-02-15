//
//  BaseView.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/02/12.
//

import UIKit

@IBDesignable
@MainActor
final class BaseView: UIView {

    // MARK: Stored Instance Properties

    @IBInspectable private var cornerRadius: CGFloat = 0.0 {
        willSet {
            layer.cornerRadius = newValue
        }
    }

}
