//
//  ViewController.swift
//  TextkitTest2
//
//  Created by 武田孝騎 on 2021/06/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var verticalTextView: VerticalTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let container = VerticalTextContainer(size: verticalTextView.bounds.size)
        let layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(container)
        layoutManager.textStorage = textView.textStorage
        verticalTextView.layoutManager = layoutManager
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

