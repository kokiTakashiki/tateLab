//
//  NoteListViewController.swift
//  TextKitTest
//
//  Created by 武田孝騎 on 2021/04/05.
//

import UIKit

class NoteListViewController: UIViewController {
    
    @IBOutlet weak var tableView: NoteListViewTable!
    
    var notes = [
      Note(text: "Shopping List\r\r1. Cheese\r2. Biscuits\r3. Sausages\r4. IMPORTANT Cash for going out!\r5. -potatoes-\r6. A copy of iOS8 by Tutorials\r7. A new iPhone\r8. A present for mum"),
      Note(text: "Meeting notes\rA long and drawn out meeting, it lasted hours and hours and hours!"),
      Note(text: "Perfection ... \n\nPerfection is achieved not when there is nothing left to add, but when there is nothing left to take away - Antoine de Saint-Exupery"),
      Note(text: "Notes on Swift\nThis new language from Apple is changing iOS development as we know it!"),
      Note(text: "Meeting notes\rA different meeting, just as long and boring"),
      Note(text: "A collection of thoughts\rWhy do birds sing? Why is the sky blue? Why is it so hard to create good test data?")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.selectDelegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.items = notes
        tableView.reloadData()
        navigationController?.navigationBar.barStyle = .black
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addNote))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func addNote() {
        print("TapAdd")
        let edidtorVC = UIStoryboard(name: "NoteEditor", bundle: nil).instantiateInitialViewController() as! NoteEditorViewController
        edidtorVC.note = Note(text: " ")
        notes.append(edidtorVC.note)
        navigationController?.pushViewController(edidtorVC, animated: true)
    }
}

extension NoteListViewController: NoteListViewTableDelegate {
    func noteListTable(_ tableView: NoteListViewTable, didSelectNoteListTable note: Note) {
        let edidtorVC = UIStoryboard(name: "NoteEditor", bundle: nil).instantiateInitialViewController() as! NoteEditorViewController
        print("note",note.contents)
        edidtorVC.note = note
        navigationController?.pushViewController(edidtorVC, animated: true)
    }
}
