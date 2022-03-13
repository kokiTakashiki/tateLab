//
//  TategakiTextView.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/02/19.
//

import UIKit

public class TategakiTextView: UIView {
    
    var view = UITextView()
    private let rotationView = UIView()
    private let ctfontSetting = UIFont.systemFont(ofSize: 15.0)
    private let fontSetting = UIFont.systemFont(ofSize: 15.2)
    var text: String {
        get {
            return view.text
        }
        set {
            view.text = newValue
            ctFrame = nil
        }
    }
    
//    public var textTest: String? = nil {
//        didSet {
//            ctFrame = nil
//        }
//    }
    private var ctFrame: CTFrame? = nil

    override public func draw(_ rect: CGRect) {
        guard let context:CGContext = UIGraphicsGetCurrentContext() else {
            return
        }
        context.scaleBy(x: 1, y: -1)
        context.translateBy(x: 0, y: -rect.height)
        
        // 行間の設定
        let lineSpaceStyle = NSMutableParagraphStyle()
        lineSpaceStyle.lineSpacing = -31

        let baseAttributes: [NSAttributedString.Key : Any] = [
            .verticalGlyphForm: true,
            .font : ctfontSetting,
//            NSAttributedString.Key.font: UIFont.hiraMinProN_W6(size: 25),
            .paragraphStyle: lineSpaceStyle // 行間
        ]
        let attributedText = NSMutableAttributedString(string: text , attributes: baseAttributes)
        let setter = CTFramesetterCreateWithAttributedString(attributedText)
        let path = CGPath(rect: rect, transform: nil)
        let frameAttrs = [
            kCTFrameProgressionAttributeName: CTFrameProgression.rightToLeft.rawValue,
        ]
        let ct = CTFramesetterCreateFrame(setter, CFRangeMake(0, 0), path, frameAttrs as CFDictionary)
        ctFrame = ct

        CTFrameDraw(ct, context)
    }
    
//    lazy var textStorage: NSTextStorage = {
//        let appDelegate = UIApplication.shared.delegate as? AppDelegate
//        return appDelegate!.textStorage
//    }()
    
    func setup() {
        // FIXME: UI related settings should go in LayoutSubviews
        //view.backgroundColor = UIColor.yellowColor()
        //rotationView.isUserInteractionEnabled = userInteractionEnabledForSubviews
        
//        let textContainer = NSTextContainer(size: .zero)
//        textContainer.widthTracksTextView = true
//
//        let layoutManager = TategakiLayoutManager()
//        layoutManager.addTextContainer(textContainer)
//        textStorage.addLayoutManager(layoutManager)
//        view = UITextView(frame: CGRect.zero, textContainer: textContainer)
        
        view.backgroundColor = .clear
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(rotationView)
        rotationView.addSubview(view)
        
        // add constraints to pin TextView to rotation view edges.
        let leadingConstraint = NSLayoutConstraint(item: self.view, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: rotationView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1.0, constant: 0)
        let trailingConstraint = NSLayoutConstraint(item: self.view, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: rotationView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1.0, constant: 0)
        let topConstraint = NSLayoutConstraint(item: self.view, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: rotationView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1.0, constant: 0)
        let bottomConstraint = NSLayoutConstraint(item: self.view, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: rotationView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1.0, constant: 0)
        rotationView.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
        
        // set font if user didn't specify size in IB
        view.font = fontSetting
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.setup()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        rotationView.transform = CGAffineTransform.identity
        rotationView.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: self.bounds.height, height: self.bounds.width))
        rotationView.transform = translateRotateFlip()
        
//        if self.view.text.isEmpty == false {
//            self.view.scrollRangeToVisible(NSMakeRange(0, 1))
//        }
        
        // could do this instead of using constraints
        //view.frame = rotationView.bounds
        
    }
    
    func translateRotateFlip() -> CGAffineTransform {
        
        var transform = CGAffineTransform.identity
        
        // translate to new center
        transform = transform.translatedBy(x: (self.bounds.width / 2)-(self.bounds.height / 2), y: (self.bounds.height / 2)-(self.bounds.width / 2))
        // rotate counterclockwise around center
        transform = transform.rotated(by: CGFloat(-Double.pi/2))
        // flip vertically
        transform = transform.scaledBy(x: -1, y: -1)
        
        return transform
    }
}
