//
//  NoteListViewTable.swift
//  TextKitTest
//
//  Created by 武田孝騎 on 2021/04/09.
//

import UIKit

protocol NoteListViewTableDelegate: AnyObject {
    func noteListTable(_ tableView: NoteListViewTable, didSelectNoteListTable note: Note)
}

final class NoteListViewTable: UITableView {
    weak var selectDelegate: NoteListViewTableDelegate?
    
    var items: [Any] = [] {
        didSet { reloadData() }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self
        self.dataSource = self
        //self.tableFooterView = UIView()
        
        register(.init(nibName: "NoteListViewTabelCell", bundle: nil), forCellReuseIdentifier: "NoteListViewTabelCell")
    }
}

extension NoteListViewTable: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewData = items[indexPath.row]
        if let item = viewData as? Note {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NoteListViewTabelCell", for: indexPath) as! NoteListViewTabelCell
            cell.setData(text: item.title)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewData = items[indexPath.row]
        if let item = viewData as? Note {
            selectDelegate?.noteListTable(self, didSelectNoteListTable: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

