//
//  VerticalTextView2.swift
//  CoreTextTest
//
//  Created by 武田孝騎 on 2021/07/03.
//

import Foundation
import UIKit

final class VerticalTextView: UITextView {
    
    //var layoutManager: NSLayoutManager?
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext();
        
        // Enumerate all the line fragments in the text
        layoutManager.enumerateLineFragments(forGlyphRange: NSMakeRange(0, layoutManager.numberOfGlyphs), using: {
            (lineRect: CGRect, usedRect: CGRect, textContainer: NSTextContainer!, glyphRange: NSRange, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
            
            context?.saveGState()
            
            // Lay the text vertically, reading top-left to bottom-right
            context?.scaleBy(x: -1, y: 1)
            context?.rotate(by: CGFloat(Double.pi / 2))
            
            // Flip text line fragment along X axis
            context?.translateBy(x: 0, y: lineRect.origin.y)
            context?.scaleBy(x: 1, y: -1)
            context?.translateBy(x: 0, y: -(lineRect.origin.y + lineRect.size.height))
            
            // Draw the line fragment
            self.layoutManager.drawGlyphs(forGlyphRange: glyphRange, at: CGPoint.zero)
            
            context?.restoreGState();
        })
        
        layoutManager.showCGGlyphs(<#T##glyphs: UnsafePointer<CGGlyph>##UnsafePointer<CGGlyph>#>, positions: <#T##UnsafePointer<CGPoint>#>, count: <#T##Int#>, font: <#T##UIFont#>, textMatrix: <#T##CGAffineTransform#>, attributes: <#T##[NSAttributedString.Key : Any]#>, in: <#T##CGContext#>)
    }
}
