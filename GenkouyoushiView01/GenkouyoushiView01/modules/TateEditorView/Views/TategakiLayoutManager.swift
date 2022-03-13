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
        
        //UIColor.blue.set()
        
//        var flip = textMatrix//CGAffineTransform(translationX: 40, y: 40)
//        flip = flip.scaledBy(x: 1, y: -1)
//        flip = flip.rotated(by: CGFloat(-Double.pi/2))
        
        // 行間の設定
        let lineSpaceStyle = NSMutableParagraphStyle()
//        lineSpaceStyle.lineSpacing = -20
        lineSpaceStyle.alignment = .right
        
        //var newPoint = CGPoint(x: positions.pointee.y, y: positions.pointee.x)
        var baseAttributes = attributes
//        let baseAttributes: [NSAttributedString.Key : Any] = [
//            .verticalGlyphForm: true,
//            .font : UIFont.systemFont(ofSize: 15.0),
////            NSAttributedString.Key.font: UIFont.hiraMinProN_W6(size: 25),
//            .paragraphStyle: lineSpaceStyle // 行間
//        ]
        baseAttributes.updateValue(true, forKey: .verticalGlyphForm)
        baseAttributes.updateValue(UIFont.systemFont(ofSize: 15.0), forKey: .font)
        baseAttributes.updateValue(lineSpaceStyle, forKey: .paragraphStyle)
        
        // 枠もじを作るだけ
//        let path = CTFontCreatePathForGlyph(font, glyphs.pointee, &flip)!
//        CGContext.addPath(path)
//        CGContext.strokePath()
        
        super.showCGGlyphs(glyphs,
                           positions: positions,
                           count: glyphCount,
                           font: font,
                           textMatrix: textMatrix,
                           attributes: baseAttributes,
                           in: CGContext)
        
        
    }
}
