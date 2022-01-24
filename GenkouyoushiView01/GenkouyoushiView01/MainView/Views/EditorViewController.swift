//
//  EditorViewController.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/01/06.
//

import UIKit

@MainActor
protocol EditorUserInterface: AnyObject {
}

@MainActor
final class EditorViewController: UIViewController {

    private var presenter: EditorEventHandler!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //tategakiView.text = textView.text
        textView.delegate = self
        
        Task {
            await presenter.viewDidLoad()
        }
    }
}

extension EditorViewController: UITextViewDelegate {
    func textViewDidChangeSelection(_ textView: UITextView) {
        // labelの更新
//        OperationQueue.main.addOperation({
//            // UI の更新処理を記述する
//            self.tategakiView.text = textView.text//"変更後の文字列"
//            self.tategakiView.setNeedsDisplay()
//        })
    }
}

extension EditorUserInterface {
}
