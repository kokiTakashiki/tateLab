//
//  TategakiContainerViewController.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/01/07.
//

import UIKit

final class TategakiContainerViewController: UIViewController {

    @IBOutlet weak var tategakiView: TategakiView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tategakiView.text = textView.text
    }
}
