//
//  ViewController.swift
//  GenkouyouShi3
//
//  Created by 武田孝騎 on 2021/03/07.
//

import UIKit
import CoreText

class ViewController: UIViewController {
    
    //let myView = MyView(frame: CGRect(x:50, y:50, width:250, height:500))

    let textView = MyTextView(frame: CGRect(x:300, y:50, width:250, height:500))//UITextView()
    
    // 表示用ラベル
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //view.addSubview(myView)
        
//        label.frame = CGRect(x:50, y:50, width:250, height:500)
//        label.text = "Test"
//        label.numberOfLines = 100
//        label.lineBreakMode = .byWordWrapping
//        //　ラベル枠の枠線太さと色
//        label.layer.borderColor = UIColor.blue.cgColor
//        label.layer.borderWidth = 2
//        view.addSubview(label)
//
//
        //textView.frame = CGRect(x:300, y:50, width:250, height:500)
//        textView.center.x = self.view.frame.width - 150
//        textView.center.y = 250 + 100
//
//        textView.text = "Test"
//        //　ラベル枠の枠線太さと色
//        textView.layer.borderColor = UIColor.green.cgColor
//        textView.layer.borderWidth = 2
//        //textView.isHidden = false
//        textView.delegate = self
        
        
        // 覚悟の縦書き　CoreText
//        let myMutableString = NSMutableAttributedString(
//           string: "こんにちは",
//            attributes: [NSAttributedString.Key.font:UIFont(
//           name: "Georgia",
//                            size: 18.0)!, NSAttributedString.Key.verticalGlyphForm:1])
//        textView.attributedText = myMutableString
        
        //textView.transform = CGAffineTransform(rotationAngle: M_PI/2)
        
        view.addSubview(textView)
        
    }


}

class MyTextView: UITextView {

    let textString = """
そのころわたくしは、モリーオ市の博物局に勤めて居りました。
　十八等官でしたから役所のなかでも、ずうっと下の方でしたし俸給ほうきゅうもほんのわずかでしたが、受持ちが標本の採集や整理で生れ付き好きなことでしたから、わたくしは毎日ずいぶん愉快にはたらきました。殊にそのころ、モリーオ市では競馬場を植物園に拵こしらえ直すというので、その景色のいいまわりにアカシヤを植え込んだ広い地面が、切符売場や信号所の建物のついたまま、わたくしどもの役所の方へまわって来たものですから、わたくしはすぐ宿直という名前で月賦で買った小さな蓄音器と二十枚ばかりのレコードをもって、その番小屋にひとり住むことになりました。わたくしはそこの馬を置く場所に板で小さなしきいをつけて一疋の山羊を飼いました。毎朝その乳をしぼってつめたいパンをひたしてたべ、それから黒い革のかばんへすこしの書類や雑誌を入れ、靴もきれいにみがき、並木のポプラの影法師を大股にわたって市の役所へ出て行くのでした。
　あのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。
　またそのなかでいっしょになったたくさんのひとたち、ファゼーロとロザーロ、羊飼のミーロや、顔の赤いこどもたち、地主のテーモ、山猫博士のボーガント・デストゥパーゴなど、いまこの暗い巨きな石の建物のなかで考えていると、みんなむかし風のなつかしい青い幻燈のように思われます。では、わたくしはいつかの小さなみだしをつけながら、しずかにあの年のイーハトーヴォの五月から十月までを書きつけましょう。
"""
    
//    required init(coder aDecoder: NSCoder) {
//      super.init(coder: aDecoder)!
//    }
//
//    required init(frame: CGRect) {
//      super.init(frame: frame)
//      backgroundColor = .white
//    }

    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        // Flip the coordinate system
        context.textMatrix = .identity
        context.translateBy(x: 0, y: bounds.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        
        let path = CGMutablePath()
        path.addRect(bounds)
        
        // 横書き
//        let astr = NSAttributedString(string: textString)
//        let setter = CTFramesetterCreateWithAttributedString(astr)
//        let frame = CTFramesetterCreateFrame(setter, CFRange(), path, nil)
        
        let stringAttrs: [NSAttributedString.Key : Any] = [
            .verticalGlyphForm: true,
        ]
        let astr = NSAttributedString(string: textString, attributes: stringAttrs)
        let setter = CTFramesetterCreateWithAttributedString(astr)
        let frameAttrs = [
            kCTFrameProgressionAttributeName: CTFrameProgression.rightToLeft.rawValue,
        ]
        let frame = CTFramesetterCreateFrame(setter, CFRange(), path, frameAttrs as CFDictionary)
        
        CTFrameDraw(frame, context)
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView){
        // 編集終了時の処理
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        // 多分編集中
        
        // labelの更新
        OperationQueue.main.addOperation({
            // UI の更新処理を記述する
            self.label.text = textView.text//"変更後の文字列"
        })

    }
}

