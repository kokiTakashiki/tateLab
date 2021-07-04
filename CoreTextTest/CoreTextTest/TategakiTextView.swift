//
//  TategakiTextView.swift
//  CoreTextTest
//
//  Created by 武田孝騎 on 2021/06/29.
//

import Foundation
import UIKit

class TategakiTextView: UITextView {
    override public func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        drawVText(context: context, string: text, rect: rect)
        
    }
    
    private func drawVText(context: CGContext, string: String, rect: CGRect) {
        context.saveGState()
        defer { context.restoreGState() }
        let transform = CGAffineTransform(rotationAngle: CGFloat.pi/2).scaledBy(x: 1, y: -1)
        context.concatenate(transform)
        let frame = createFrame(string: string, rect: rect.applying(transform.inverted()))!
        context.textMatrix = CGAffineTransform.identity
        
        //context.scaleBy(x: 1, y: -1)
        //let frame = createFrame(string: string, rect: rect)!
        
        CTFrameDraw(frame, context)
    }
    
    private func createFrame(string: String, rect: CGRect) -> CTFrame? {
        let astr = NSAttributedString(string: string, attributes: [.verticalGlyphForm: true])
        let setter = CTFramesetterCreateWithAttributedString(astr)
        let path = CGPath(rect: rect, transform: nil)
        return CTFramesetterCreateFrame(setter, CFRange(), path, nil)
    }
}
