//
//  UserService.swift
//  
//
//  Created by Sascha Müllner on 29.02.20.
//

import Foundation

public class UserService: UserServiceProtocol {

    private var userRepository: UserRepositoryProtocol

    public init(userRepository: UserRepositoryProtocol) {
        self.userRepository = userRepository
    }

    public init() {
        self.userRepository = PropertyListUserRepository()
    }

    public func create() -> User {
        let user = User()
        self.userRepository.save(user: user)
        return user
    }

    public func save(user: User) {
        self.userRepository.save(user: user)
    }

    public func delete(user: User) {
        if(current?.id == user.id) {
            current = nil
        }
        self.userRepository.delete(user: user)
    }

    public var all: [User] {
        return self.userRepository.all
    }

    public var hasUsers: Bool {
        return self.all.count > 0
    }

    public var current: User? {
        get {
            return self.userRepository.current
        }
        set(user) {
            self.userRepository.current = user
        }
    }
}
