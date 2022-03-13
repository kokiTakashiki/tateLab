//
//  TateEditor2ViewController.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/02/21.
//

import UIKit

@MainActor
protocol TateEditor2UserInterface: AnyObject {
}

@MainActor
final class TateEditor2ViewController: UIViewController {

    // MARK: Type Aliases

    // MARK: Stored Instance Properties
    
    private var presenter: TateEditor2EventHandler!
    
    //private var editData: TateEditEntity!

    // MARK: Computed Instance Properties

    // MARK: IBOutlets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //editData = TateEditEntity(title: "test", description: "2022/01/29", content: textView.text)
        textView.text = "あああああああ"
        textView.view.delegate = self
        
        Task {
            await presenter.viewDidLoad()
        }
    }
    
    // MARK: IBActions

    // MARK: Other Internal Methods

    func inject(
        presenter: TateEditor2EventHandler
        //logger: LoggerProtocol = Logger.default
    ) {
        self.presenter = presenter
        //self.logger = logger
    }

    // MARK: Other Private Methods
}

extension TateEditor2ViewController: UITextViewDelegate {
    func textViewDidChangeSelection(_ textView: UITextView) {
        Task {
            self.textView.setNeedsDisplay()
        }
    }
}

extension TateEditor2ViewController: TateEditor2UserInterface {
}
