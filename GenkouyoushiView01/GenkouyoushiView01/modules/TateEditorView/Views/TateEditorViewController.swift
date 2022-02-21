//
//  TateEditorViewController.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/02/19.
//

import UIKit

@MainActor
protocol TateEditorUserInterface: AnyObject {
}

@MainActor
final class TateEditorViewController: UIViewController {

    // MARK: Type Aliases

    // MARK: Stored Instance Properties
    
    private var presenter: TateEditorEventHandler!
    
    //private var editData: TateEditEntity!

    // MARK: Computed Instance Properties

    // MARK: IBOutlets
    @IBOutlet weak var textView: TategakiTextView!
    
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
        presenter: TateEditorEventHandler
        //logger: LoggerProtocol = Logger.default
    ) {
        self.presenter = presenter
        //self.logger = logger
    }

    // MARK: Other Private Methods
}

extension TateEditorViewController: UITextViewDelegate {
    func textViewDidChangeSelection(_ textView: UITextView) {
        Task {
            self.textView.setNeedsDisplay()
        }
    }
}

extension TateEditorViewController: TateEditorUserInterface {
}
