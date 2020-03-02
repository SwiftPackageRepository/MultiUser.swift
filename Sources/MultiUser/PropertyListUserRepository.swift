//
//  PropertyListUserRepository.swift
//  
//
//  Created by Sascha Müllner on 02.03.20.
//

import Foundation

public class PropertyListUserRepository : UserRepositoryProtocol {

    public init() {
        do
        {
            try FileManager.default.createDirectory(atPath: usersDirectory.path, withIntermediateDirectories: true, attributes: nil)
        }
        catch let error as NSError
        {
            print("Unable to create directory \(error.debugDescription)")
        }
    }

    public func save(user: User) {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        do {
            guard let url = self.getURL(user: user) else {
                return
            }
            let data = try encoder.encode(user)
            try data.write(to: url)
        } catch {
            print(error)
        }
    }

    public func delete(user: User) {
        do
        {
            guard let url = self.getURL(user: user) else {
                return
            }
            try FileManager.default.removeItem(at: url)
        }
        catch let error as NSError
        {
            print("Unable to delete file \(error.debugDescription)")
        }
    }

    public var all: [User] {
        var users = [User]()
        for userURL in self.userURLs {
            guard let user = self.read(url: userURL) else {
                continue
            }
            users.append(user)
        }
        return users
    }

    public var current: User? {
        get {
            guard let currentUserUUID = self.userIndex?.currentUserUUID else {
                return nil
            }
            return self.read(userUUID: currentUserUUID)
        }
        set(user) {
            guard let userId = user?.id else {
                return
            }
            var userIndex = self.userIndex ?? UserIndex()
            userIndex.currentUserUUID = userId
            self.userIndex = userIndex
        }
    }

    private func read(userUUID: UUID) -> User? {
        let userId = userUUID.uuidString
        let url = self.usersDirectory.appendingPathComponent(userId, isDirectory: false)
        return self.read(url: url)
    }

    private func read(url: URL) -> User? {
        let path = url.path
        if  FileManager.default.isReadableFile(atPath: path),
            let xml  = FileManager.default.contents(atPath: path),
            let user = try? PropertyListDecoder().decode(User.self, from: xml)
        {
            return user
        }
        return nil
    }

    private var usersDirectory :URL {
        get {
            let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
            let usersDirectory = paths[0].appendingPathComponent("users", isDirectory: true)
            return usersDirectory
        }
    }

    private var userURLs :[URL] {
        get {
            do {
                return try FileManager.default.contentsOfDirectory(at: self.usersDirectory, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            } catch {
                print("Error while enumerating files \(self.usersDirectory.path): \(error.localizedDescription)")
            }
            return []
        }
    }

    private func getURL(user: User) -> URL? {
        let userId = user.id
        return self.usersDirectory.appendingPathComponent(userId.uuidString, isDirectory: false)
    }

    private var usersIndexURL :URL {
        return self.usersDirectory.appendingPathComponent("users.idx", isDirectory: false)
    }

    private var userIndex: UserIndex? {
        get {
            let path = self.usersIndexURL.path
            if  FileManager.default.isReadableFile(atPath: path),
                let xml  = FileManager.default.contents(atPath: path),
                let userIndex = try? PropertyListDecoder().decode(UserIndex.self, from: xml)
            {
                return userIndex
            }
            return nil
        }
        set(userIndex) {
            let encoder = PropertyListEncoder()
            encoder.outputFormat = .xml
            do {
                let url = self.usersIndexURL
                let data = try encoder.encode(userIndex)
                try data.write(to: url)
            } catch {
                print(error)
            }
        }
    }
}
