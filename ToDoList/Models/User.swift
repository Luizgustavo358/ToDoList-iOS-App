//
//  User.swift
//  ToDoList
//
//  Created by Luiz Gustavo Bragança dos Santos on 09/01/25.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
