//
//  UserService.swift
//  
//
//  Created by Sascha Müllner on 29.02.20.
//

import Foundation

class UserService : UserServiceProtocol {

    private var userRepository :UserRepositoryProtocol

    public init(userRepository :UserRepositoryProtocol) {
        self.userRepository = userRepository
    }

    public init() {
        self.userRepository = PropertyListUserRepository()
    }

    func create() -> User {
        let user = User()
        self.userRepository.save(user: user)
        return user
    }

    func save(user: User) {
        self.userRepository.save(user: user)
    }

    func delete(user: User) {
        if(current?.id == user.id) {
            current = nil
        }
        self.userRepository.delete(user: user)
    }

    var all: [User] {
        return self.userRepository.all
    }

    var hasUsers: Bool {
        return self.all.count > 0
    }

    var current: User? {
        get {
            return self.userRepository.current
        }
        set(user) {
            self.userRepository.current = user
        }
    }
}
