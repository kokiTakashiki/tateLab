//
//  DemoListEntity.swift
//  GenkouyoushiView01
//
//  Created by 武田孝騎 on 2022/02/12.
//

import Foundation

struct DemoListEntity: Equatable {
    var title: String
    var description: String
}

extension DemoListEntity: Codable {}

extension DemoListEntity: Sendable {}
