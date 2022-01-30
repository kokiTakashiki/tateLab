//
//  TategakiView.swift
//  CoreTextTest
//
//  Created by 武田孝騎 on 2021/06/29.
//

import Foundation
import UIKit

public class TategakiView: UIView {
    public var text: String? = nil {
        didSet {
            ctFrame = nil
        }
    }
    private var ctFrame: CTFrame? = nil

    override public func draw(_ rect: CGRect) {
        guard let context:CGContext = UIGraphicsGetCurrentContext() else {
            return
        }
        context.scaleBy(x: 1, y: -1)
        context.translateBy(x: 0, y: -rect.height)
        
        // 行間の設定
        let lineSpaceStyle = NSMutableParagraphStyle()
        lineSpaceStyle.lineSpacing = -20

        let baseAttributes: [NSAttributedString.Key : Any] = [
            .verticalGlyphForm: true,
            .font : UIFont.systemFont(ofSize: 15.0),
//            NSAttributedString.Key.font: UIFont.hiraMinProN_W6(size: 25),
            .paragraphStyle: lineSpaceStyle // 行間
        ]
        let attributedText = NSMutableAttributedString(string: text ?? "", attributes: baseAttributes)
        let setter = CTFramesetterCreateWithAttributedString(attributedText)
        let path = CGPath(rect: rect, transform: nil)
        let frameAttrs = [
            kCTFrameProgressionAttributeName: CTFrameProgression.rightToLeft.rawValue,
        ]
        let ct = CTFramesetterCreateFrame(setter, CFRangeMake(0, 0), path, frameAttrs as CFDictionary)
        ctFrame = ct

        CTFrameDraw(ct, context)
    }
}
