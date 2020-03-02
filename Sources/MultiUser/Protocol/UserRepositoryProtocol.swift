//
//  UserRepositoryProtocol.swift
//  
//
//  Created by Sascha Müllner on 02.03.20.
//

import Foundation

protocol UserRepositoryProtocol {
    func save(user: User)
    func delete(user: User)
    var all: [User] { get }
    var current: User? { get set }
}
