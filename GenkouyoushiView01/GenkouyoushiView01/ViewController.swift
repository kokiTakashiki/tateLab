//
//  ViewController.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/01/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tategakiView: TategakiView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tategakiView.text = textView.text
        textView.delegate = self
    }


}

extension ViewController: UITextViewDelegate {
    func textViewDidChangeSelection(_ textView: UITextView) {
        // labelの更新
        OperationQueue.main.addOperation({
            // UI の更新処理を記述する
            self.tategakiView.text = textView.text//"変更後の文字列"
            self.tategakiView.setNeedsDisplay()
        })
    }
}
