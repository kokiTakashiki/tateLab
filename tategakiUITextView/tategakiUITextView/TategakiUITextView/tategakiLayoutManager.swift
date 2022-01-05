//
//  tategakiLayoutManager.swift
//  tategakiUITextView
//
//  Created by 武田孝騎 on 2021/10/17.
//

import UIKit

class tategakiLayoutManager: NSLayoutManager {
    override func showCGGlyphs(_ glyphs: UnsafePointer<CGGlyph>,
                               positions: UnsafePointer<CGPoint>,
                               count glyphCount: Int,
                               font: UIFont,
                               textMatrix: CGAffineTransform,
                               attributes: [NSAttributedString.Key : Any] = [:],
                               in CGContext: CGContext) {
        guard attributes[kCTBackgroundColorAttributeName as NSAttributedString.Key] != nil else {
            super.showCGGlyphs(glyphs,
                               positions: positions,
                               count: glyphCount,
                               font: font,
                               textMatrix: textMatrix,
                               attributes: attributes,
                               in: CGContext)
            return
        }
        CGContext.saveGState()
        CGContext.setBlendMode(.destinationOut)
        
        super.showCGGlyphs(glyphs,
                           positions: positions,
                           count: glyphCount,
                           font: font,
                           textMatrix: textMatrix,
                           attributes: attributes,
                           in: CGContext)
        CGContext.restoreGState()
    }
}
