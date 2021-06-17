//
//  VerticalTextView.swift
//  TextkitTest2
//
//  Created by 武田孝騎 on 2021/06/17.
//

import UIKit

class VerticalTextView: UIView {
    
    var layoutManager: NSLayoutManager?
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext();
        
        // Enumerate all the line fragments in the text
        layoutManager?.enumerateLineFragments(forGlyphRange: NSMakeRange(0, layoutManager!.numberOfGlyphs), using: {
            (lineRect: CGRect, usedRect: CGRect, textContainer: NSTextContainer!, glyphRange: NSRange, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
            
            context?.saveGState()
            
            // Lay the text vertically, reading top-left to bottom-right
            //context?.scaleBy(x: -1, y: 1)
            context?.rotate(by: CGFloat(Double.pi / 2))
            
            // Flip text line fragment along X axis
            context?.translateBy(x: 0, y: lineRect.origin.y)
            //context?.scaleBy(x: 1, y: -1)
            context?.translateBy(x: 0, y: -(lineRect.origin.y + lineRect.size.height))
            
            // Draw the line fragment
            self.layoutManager?.drawGlyphs(forGlyphRange: glyphRange, at: CGPoint.zero)
            
            context?.restoreGState();
        })
    }
}
