//
//  UserService.swift
//  
//
//  Created by Sascha Müllner on 29.02.20.
//

import Foundation

class UserService : UserServiceProtocol {

    private var _currentUser :User?

    func create() -> User {
        let user = User()
        return user
    }

    func save(user: User) {

    }

    func delete(user: User) {

    }

    var all: [User] {
        get {
            return []
        }
    }

    var hasUsers: Bool {
        get {
            return self.all.count > 0
        }
    }

    var current: User? {
        get {
            return _currentUser
        }
        set(user) {
            _currentUser = user
        }
    }
}
