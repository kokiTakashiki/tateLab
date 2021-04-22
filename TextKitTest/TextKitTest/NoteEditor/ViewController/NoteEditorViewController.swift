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
        //textView.text = note.contents
        navigationController?.navigationBar.barStyle = .black
        notificationCenterAdd()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
      return .lightContent
    }
}

// MARK: - UITextViewDelegate
extension NoteEditorViewController: UITextViewDelegate {
  func textViewDidEndEditing(_ textView: UITextView) {
    note.contents = textView.text
  }
}

// MARK: - private
extension NoteEditorViewController {
    private func notificationCenterAdd() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidShow),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardDidHide),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
    }
    
    private func updateTextViewSizeForKeyboardHeight(keyboardHeight: CGFloat) {
      textView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - keyboardHeight)
    }
    
    @objc func keyboardDidShow(notification: NSNotification) {
      if let rectValue = notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue {
        let keyboardSize = rectValue.cgRectValue.size
        updateTextViewSizeForKeyboardHeight(keyboardHeight: keyboardSize.height)
      }
    }
    
    @objc func keyboardDidHide(notification: NSNotification) {
      updateTextViewSizeForKeyboardHeight(keyboardHeight: 0)
    }
}
