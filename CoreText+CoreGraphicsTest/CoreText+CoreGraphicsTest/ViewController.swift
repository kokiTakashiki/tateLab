//
//  ViewController.swift
//  CoreText+CoreGraphicsTest
//
//  Created by 武田孝騎 on 2021/10/13.
//

import UIKit

class MyView: UIView {

    var scale: CGFloat = 1

    override func draw(_ rect: CGRect) {
        let font = CTFontCreateWithName("NotoSansJP-Regular-Tate" as CFString, 40, nil)
        let text = "あいうえお";
        var glyph: CGGlyph = 0
        var unichar: UniChar = text.utf16[text.utf16.startIndex]
        CTFontGetGlyphsForCharacters(font, &unichar, &glyph, 1)
        var flip = CGAffineTransform(translationX: 10, y: 50)
        flip = flip.scaledBy(x: 1, y: -1)
        //flip = flip.rotated(by: CGFloat(-M_PI_2))
        let path = CTFontCreatePathForGlyph(font, glyph, &flip)!
        //let c = UIGraphicsGetCurrentContext()
        // コンテキストを取得
        guard let c = UIGraphicsGetCurrentContext() else { return }

        UIColor.blue.set()
        c.scaleBy(x: scale, y: scale)
        c.addPath(path)
        c.setLineWidth(4.0)
        //CGContextSetLineWidth(c, 4)
        c.setLineCap(.round)
        //CGContextSetLineCap(c, kCGLineCapRound)
        c.setLineJoin(.round)
        //CGContextSetLineJoin(c, kCGLineJoinRound)
        c.setLineDash(phase: 0, lengths: [])
        //CGContextSetLineDash(c, 0, nil, 0)
        c.strokePath()
    }
}

class ViewController: UIViewController {
    
    private var myView: MyView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let slider = UISlider(frame: CGRect(x: 10, y: 30, width: 400, height: 0))
        slider.sizeToFit()
        slider.minimumValue = 1
        slider.maximumValue = 10
        slider.addTarget(self, action: #selector(didChangeScale(_:)), for: .valueChanged)
        view.addSubview(slider)

        myView = MyView(frame: CGRect(x: 10, y: 80, width: 700, height: 700))
        myView.backgroundColor = UIColor.yellow
        view.addSubview(myView)
    }

    @objc func didChangeScale(_ slider: UISlider) {
        myView.scale = CGFloat(slider.value)
        print(myView.scale)
        myView.setNeedsDisplay()
    }
}

