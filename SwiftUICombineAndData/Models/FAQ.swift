//
//  FAQ.swift
//  SwiftUICombineAndData
//
//  Created by Daniel Yeboah on 21.4.2023.
//

import Foundation

struct FAQ: Decodable, Identifiable {
    var id: Int
    var question: String
    var answer: String
}
