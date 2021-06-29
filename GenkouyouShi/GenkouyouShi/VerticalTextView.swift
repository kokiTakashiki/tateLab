//
//  VerticalTextView.swift
//  GenkouyouShi
//
//  Created by 武田孝騎 on 2021/06/28.
//

import SwiftUI

struct VerticalTextView: View {
    @State var text: String = "テスト文字が入っています。"

    let windowWid = UIScreen.main.bounds.width
    let windowhgt = UIScreen.main.bounds.height
    
    var body: some View {
        HStack {
            // 表示
            //VerticalTexter(textView: text)
            Text(text)
                //.foregroundColor(.orange)
                //.lineLimit(nil)
                //.padding(5)
                .frame(width: windowWid * 0.45, height: windowhgt * 0.8)//, alignment: .topLeading)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.green, lineWidth: 5)
                )
                //.padding(.trailing, 500.0)
            // 入力
            MultilineTextField(text: $text)
                .frame(width: windowWid * 0.45, height: windowhgt * 0.8)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue, lineWidth: 5)
                )
                //.padding(.trailing, -1000.0)
        }
    }
}

struct VerticalTexter: UIViewRepresentable {
    public var textView: UITextView?

    func makeUIView(context: Context) -> VerticalText {
        let uiView = VerticalText()
        
        let container = VerticalTextContainer(size: uiView.bounds.size)
        let layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(container)
        layoutManager.textStorage = textView?.textStorage
        
        uiView.layoutManager = layoutManager
        return uiView
    }

    func updateUIView(_ uiView: VerticalText, context: Context) {
        let container = VerticalTextContainer(size: uiView.bounds.size)
        let layoutManager = NSLayoutManager()
        layoutManager.addTextContainer(container)
        layoutManager.textStorage = textView?.textStorage
        
        uiView.layoutManager = layoutManager
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

class VerticalText: UIView {
    
    var layoutManager: NSLayoutManager?
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext();
        
        // Enumerate all the line fragments in the text
        layoutManager?.enumerateLineFragments(forGlyphRange: NSMakeRange(0, layoutManager!.numberOfGlyphs), using: {
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
            self.layoutManager?.drawGlyphs(forGlyphRange: glyphRange, at: CGPoint.zero)
            
            context?.restoreGState();
        })
    }
}

struct VerticalTextView_Previews: PreviewProvider {
    static var previews: some View {
        VerticalTextView()
    }
}
