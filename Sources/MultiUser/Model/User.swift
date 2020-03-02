//
//  User.swift
//
//
//  Created by Sascha Müllner on 29.02.20.
//

import Foundation

struct User : Codable {
    private var uuid:UUID

    var username: String?
    var firstname: String?
    var lastname: String?
    var birthday: Date?
    var emails: [String]?
    var attributes: [String: String]?
    var icon: Data?
    var data: [Data]?

    init() {
        self.uuid = UUID()
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.uuid = try values.decode(UUID.self, forKey: .uuid)
        self.username = try values.decode(String.self, forKey: .username)
        self.firstname = try values.decode(String.self, forKey: .firstname)
        self.lastname = try values.decode(String.self, forKey: .lastname)
        self.birthday = try values.decode(Date.self, forKey: .birthday)
        self.emails = try values.decode([String].self, forKey: .emails)
        self.attributes = try values.decode([String: String].self, forKey: .attributes)
        self.icon = try values.decode(Data.self, forKey: .icon)
        self.data = try values.decode([Data].self, forKey: .data)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.uuid, forKey: .uuid)
        try container.encode(self.username, forKey: .username)
        try container.encode(self.firstname, forKey: .firstname)
        try container.encode(self.lastname, forKey: .lastname)
        try container.encode(self.birthday, forKey: .birthday)
        try container.encode(self.emails, forKey: .emails)
        try container.encode(self.attributes, forKey: .attributes)
        try container.encode(self.icon, forKey: .icon)
        try container.encode(self.data, forKey: .data)
    }

    var id: UUID {
        get {
            return self.uuid
        }
    }

    private enum CodingKeys: String, CodingKey {
        case uuid, username, firstname, lastname, birthday, emails, attributes, icon, data
    }
}
