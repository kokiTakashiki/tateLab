//
//  ViewController.swift
//  tategakiUITextView
//
//  Created by 武田孝騎 on 2021/10/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myTategakiTextView: UIMongolTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTategakiTextView.text = "あ"
        
    }
}

