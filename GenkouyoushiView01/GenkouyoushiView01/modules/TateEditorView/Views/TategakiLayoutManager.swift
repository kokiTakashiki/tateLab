//
//  TategakiLayoutManager.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/02/19.
//

import UIKit

class TategakiLayoutManager: NSLayoutManager {
    override func showCGGlyphs(_ glyphs: UnsafePointer<CGGlyph>,
                               positions: UnsafePointer<CGPoint>,
                               count glyphCount: Int,
                               font: UIFont,
                               textMatrix: CGAffineTransform,
                               attributes: [NSAttributedString.Key : Any] = [:],
                               in CGContext: CGContext) {
        
        UIColor.blue.set()
        
        var flip = textMatrix//CGAffineTransform(translationX: 40, y: 40)
        flip = flip.scaledBy(x: 1, y: -1)
        flip = flip.rotated(by: CGFloat(Double.pi/2))
        let path = CTFontCreatePathForGlyph(font, glyphs.pointee, &flip)!
        CGContext.addPath(path)
        CGContext.strokePath()
        
        super.showCGGlyphs(glyphs,
                           positions: positions,
                           count: glyphCount,
                           font: font,
                           textMatrix: textMatrix,//flip,
                           attributes: attributes,
                           in: CGContext)
        
        
    }
}
