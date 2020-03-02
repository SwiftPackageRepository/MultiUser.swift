//
//  UserServiceProtocol.swift
//  
//
//  Created by Sascha Müllner on 29.02.20.
//

import Foundation

protocol UserServiceProtocol {
    func create() -> User
    func save(user: User)
    func delete(user: User)
    var all: [User] { get }
    var hasUsers: Bool { get }
    var current: User? { get set }
}
