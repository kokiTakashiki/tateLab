//
//  Note.swift
//  TextKitTest
//
//  Created by 武田孝騎 on 2021/04/06.
//

import Foundation

class Note {
    var contents: String
    let timestamp: Data
    var title: String {
        let lines = contents.components(separatedBy: CharacterSet.newlines)
        return lines[0]
    }
    
    init(text: String) {
        contents = text
        timestamp = Data()
    }
}
