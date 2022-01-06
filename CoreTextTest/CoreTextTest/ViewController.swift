//
//  ViewController.swift
//  CoreTextTest
//
//  Created by 武田孝騎 on 2021/06/29.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var verticalTextView: VerticalView!
    @IBOutlet weak var tategakiView: TategakiView!
    @IBOutlet weak var tategakiTextView: TategakiTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let container = VerticalTextContainer(size: verticalTextView.bounds.size)
        let layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(container)
        //layoutManager.textStorage = verticalTextView.textStorage
        verticalTextView.layoutManager = layoutManager
        
//        let container2 = VerticalTextContainer(size: tategakiView.bounds.size)
//        let layoutManager2 = tategakiLayoutManager()
//        layoutManager2.addTextContainer(container2)
//        layoutManager2.textStorage = textView.textStorage
//        tategakiView.layoutManager = layoutManager2
        
        tategakiView.text = textView.text
        //verticalTextView.text = textView.text
        tategakiTextView.text = textView.text
        
        textView.delegate = self
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        
    }
    func textViewDidChangeSelection(_ textView: UITextView) {
        // labelの更新
        OperationQueue.main.addOperation({
            // UI の更新処理を記述する
            self.tategakiView.text = textView.text//"変更後の文字列"
            self.tategakiView.setNeedsDisplay()
        })
    }
}

class VerticalTextContainer: NSTextContainer {
    
    override func lineFragmentRect(forProposedRect proposedRect: CGRect, at characterIndex: Int, writingDirection baseWritingDirection: NSWritingDirection, remaining remainingRect: UnsafeMutablePointer<CGRect>?) -> CGRect {
        
        remainingRect?.initialize(to: CGRect.zero)
        
        // Return a rect whose width is the current height
        //return CGRectMake(0, proposedRect.origin.y, self.size.height, proposedRect.size.height)
        return CGRect.init(x: 0, y: proposedRect.origin.y, width: self.size.height, height: proposedRect.size.height)
    }
}
