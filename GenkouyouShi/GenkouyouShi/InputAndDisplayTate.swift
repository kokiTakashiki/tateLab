//
//  InputAndDisplay.swift
//  GenkouyouShi
//
//  Created by 武田孝騎 on 2021/03/06.
//

import SwiftUI
import UIKit
import CoreText

struct InputAndDisplayTate: View {
    @State var text: String = "テスト文字が入っています。"

    let windowWid = UIScreen.main.bounds.width
    let windowhgt = UIScreen.main.bounds.height
    
    var body: some View {
        HStack {
            // 表示
            TategakiTexter(text: text)
            //Text(text)
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

// 複数行入力するためのTextField
struct MultilineTextField: UIViewRepresentable {
    @Binding var text: String

//    func makeUIView(context: Context) -> UITextView {
//        let view = UITextView()
//        view.delegate = context.coordinator
//        view.isScrollEnabled = true
//        view.isEditable = true
//        view.isUserInteractionEnabled = true
//        view.font = UIFont.systemFont(ofSize: 18)
//        return view
//    }
    func makeUIView(context: Context) -> TategakiTextView {
        let view = TategakiTextView()
        view.delegate = context.coordinator as? UITextViewDelegate
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.font = UIFont.systemFont(ofSize: 18)
        view.isOpaque = false
        return view
    }

    func updateUIView(_ uiView: TategakiTextView, context: Context) {
        if uiView.text != text {
            uiView.text = text
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator : NSObject, TategakiTextViewDelegate {
        var parent: MultilineTextField

        init(_ textView: MultilineTextField) {
            self.parent = textView
        }
        func tategakiTextView(_ textView: TategakiTextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }
        
        func tategakiTextViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text ?? "default"
        }
    }
}

struct TategakiTexter: UIViewRepresentable {
    public var text: String?

    func makeUIView(context: Context) -> TategakiView {
        let uiView = TategakiView()
        uiView.isOpaque = false
        uiView.text = text
        return uiView
    }

    func updateUIView(_ uiView: TategakiView, context: Context) {
        uiView.text = text
    }
}

protocol TategakiTextViewDelegate: AnyObject {
    func tategakiTextView(_ textView: TategakiTextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool
    func tategakiTextViewDidChange(_ textView: UITextView)
}

class TategakiTextView: UITextView {
    weak var selectDelegate: TategakiTextViewDelegate?
    
    override var text: String? {
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

        let baseAttributes: [NSAttributedString.Key : Any] = [
            .verticalGlyphForm: true,
            .font : UIFont.systemFont(ofSize: 20.0),
//            NSAttributedString.Key.font: UIFont.hiraMinProN_W6(size: 25),
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

extension TategakiTextView: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        ((selectDelegate?.tategakiTextView(self, shouldChangeTextIn: range, replacementText: text)) != nil)
        //return true
    }
    func textViewDidChange(_ textView: UITextView) {
        selectDelegate?.tategakiTextViewDidChange(self)
    }
}

class TategakiView: UIView {
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

        let baseAttributes: [NSAttributedString.Key : Any] = [
            .verticalGlyphForm: true,
            .font : UIFont.systemFont(ofSize: 20.0),
//            NSAttributedString.Key.font: UIFont.hiraMinProN_W6(size: 25),
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

struct InputAndDisplayTate_Previews: PreviewProvider {
    static var previews: some View {
        InputAndDisplayTate()
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
            //.previewLayout(.fixed(width: 2388.0, height: 1668.0))
            
    }
}
