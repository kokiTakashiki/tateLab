//
//  EditorViewController.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/01/06.
//

import UIKit

@MainActor
protocol EditorUserInterface: AnyObject {
}

@MainActor
final class EditorViewController: UIViewController {

    // MARK: Type Aliases

    // MARK: Stored Instance Properties
    
    private var presenter: EditorEventHandler!
    
    private var editData: EditEntity!

    // MARK: Computed Instance Properties

    // MARK: IBOutlets
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //tategakiView.text = textView.text
        textView.delegate = self
        
        editData = EditEntity(title: "test", description: "2022/01/29", content: textView.text)
        
        Task {
            await presenter.viewDidLoad()
        }
    }
    
    // TategakiContainerは完全にEditorViewControllerの配下
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch (segue.identifier, segue.destination) {
        case ("EmbedSegue"?, let destination as TategakiContainerViewController):
            Task {
                await presenter.prepareTategakiContainer(containerView: destination, editData: editData)
            }
        default:
            ()
        }
    }
    
    // MARK: IBActions

    // MARK: Other Internal Methods

    func inject(
        presenter: EditorEventHandler
        //logger: LoggerProtocol = Logger.default
    ) {
        self.presenter = presenter
        //self.logger = logger
    }

    // MARK: Other Private Methods
}

extension EditorViewController: UITextViewDelegate {
    func textViewDidChangeSelection(_ textView: UITextView) {
        // labelの更新
//        OperationQueue.main.addOperation({
//            // UI の更新処理を記述する
//            self.tategakiView.text = textView.text//"変更後の文字列"
//            self.tategakiView.setNeedsDisplay()
//        })
        Task {
            editData.content = textView.text
            await presenter.didChangeSelectionEditContent(content: editData)
        }
    }
}

extension EditorViewController: EditorUserInterface {
}
