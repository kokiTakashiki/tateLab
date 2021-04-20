//
//  NoteEditorViewController.swift
//  TextKitTest
//
//  Created by 武田孝騎 on 2021/04/07.
//

import UIKit

class NoteEditorViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    var note: Note!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.isScrollEnabled = true
        textView.text = note.contents
        navigationController?.navigationBar.barStyle = .black
    }
}
