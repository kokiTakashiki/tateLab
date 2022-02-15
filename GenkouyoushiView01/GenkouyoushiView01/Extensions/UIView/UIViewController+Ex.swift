//
//  UIViewController+Ex.swift
//  omokake02
//
//  Created by 武田孝騎 on 2021/12/18.
//  Copyright © 2021 takasiki. All rights reserved.
//

import UIKit

extension UIViewController {
    func instantiateStoryBoardToViewController(storyBoardName: String, withIdentifier: String) -> Any {
        let storyboard = UIStoryboard(name: storyBoardName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: withIdentifier) as Any
        return viewController
    }
}
