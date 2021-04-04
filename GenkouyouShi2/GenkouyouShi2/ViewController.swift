//
//  ViewController.swift
//  GenkouyouShi2
//
//  Created by 武田孝騎 on 2021/03/06.
//

import UIKit
import TTTAttributedLabel

class ViewController: UIViewController {
    
    // 縦書きラベル
    var myLabel:TTTAttributedLabel!
    
    // 表示用ラベル
    var label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        label.frame = CGRect(x:50, y:50, width:250, height:500)
        label.text = "Test"
        label.numberOfLines = 100
        label.lineBreakMode = .byWordWrapping
        //　ラベル枠の枠線太さと色
        label.layer.borderColor = UIColor.blue.cgColor
        label.layer.borderWidth = 2
        self.view.addSubview(label)
        
        
        myLabel = TTTAttributedLabel(frame: CGRect(x: 0, y: 200, width: 500, height: 250))
        myLabel.center.x = self.view.frame.width - 150
        myLabel.center.y = 250 + 100

        view.addSubview(myLabel)
        
        //myLabel.font = UIFont.systemFont(ofSize: 20)
        //myLabel.textColor = UIColor.black
        //myLabel.backgroundColor = .red

        myLabel.numberOfLines = 100
        myLabel.verticalAlignment = .top

        let angle = CGFloat.pi/2
        myLabel.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
        myLabel.lineBreakMode = .byWordWrapping
        
        // layout
        myLabel.layer.borderColor = UIColor.green.cgColor
        myLabel.layer.borderWidth = 2

        // 初期テクスト
        let firstText = "入力してください。"

        myLabel.setText(firstText) { (mutableAttributedString) -> NSMutableAttributedString? in
            mutableAttributedString!.addAttribute(NSAttributedString.Key.init(rawValue: kCTVerticalFormsAttributeName as String), value: true, range: NSMakeRange(0, mutableAttributedString!.length))
            return mutableAttributedString
        }
        
        textView.frame = CGRect(x: 0, y: self.view.frame.height - 100, width: 500, height: 250)
        textView.center.x = self.view.frame.width - 150
        myLabel.center.y = 250 + 100
        textView.text = "Test"
        //　ラベル枠の枠線太さと色
        textView.layer.borderColor = UIColor.yellow.cgColor
        textView.layer.borderWidth = 2
        textView.isHidden = true
        textView.delegate = self
        view.addSubview(textView)
        
        myLabelEditable()
    }
    
    //let textField = UITextField()
    let textView = UITextView()
    private func myLabelEditable(){
        myLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(changeLabel)))
//        textField.isHidden = false
//        textField.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
//        view.addSubview(textField)
    }
    
    @objc func changeLabel(){
        textView.becomeFirstResponder()
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView){
        // 編集終了時の処理
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        // 多分編集中
        myLabel.setText(textView.text!) { (mutableAttributedString) -> NSMutableAttributedString? in
            mutableAttributedString!.addAttribute(NSAttributedString.Key.init(rawValue: kCTVerticalFormsAttributeName as String), value: true, range: NSMakeRange(0, mutableAttributedString!.length))
            return mutableAttributedString
        }
        
        // labelの更新
        OperationQueue.main.addOperation({
            // UI の更新処理を記述する
            self.label.text = textView.text//"変更後の文字列"
        })
    }
}

