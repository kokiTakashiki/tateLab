//
//  EditEntity.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/01/29.
//

import Foundation

struct EditEntity: Equatable {
    var title: String
    var description: String
    var content: String
}

extension EditEntity: Codable {}

extension EditEntity: Sendable {}
