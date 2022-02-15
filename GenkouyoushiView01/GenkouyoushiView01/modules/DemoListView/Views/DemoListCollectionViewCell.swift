//
//  DemoListCollectionViewCell.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/02/12.
//

import UIKit

@MainActor
final class DemoListCollectionViewCell: UICollectionViewCell {

    // MARK: Stored Instance Properties

    @IBInspectable private var masksToBounds: Bool = false {
        willSet {
            layer.masksToBounds = newValue
        }
    }

    // MARK: IBOutlets
    
    @IBOutlet weak var baseView: BaseView!
    @IBOutlet weak var titleLabel: UILabel! {
        willSet {
            newValue.text = nil
        }
    }
    
    // MARK: View Life-Cycle Methods

    override func prepareForReuse() {
        super.prepareForReuse()

        //iconImageView.image = nil
        titleLabel.text = nil
    }

    // MARK: Other Internal Methods

    func setup(name: String, elevation: Double) {
        titleLabel.text = name
        //iconImageView.image = icon
        baseView.elevate(elevation: elevation)
    }

}
