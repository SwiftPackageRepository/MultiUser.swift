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
    var icon: [Data]?
    var data: [Data]?

    init() {
        self.uuid = UUID()
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        uuid = try values.decode(UUID.self, forKey: .uuid)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(uuid, forKey: .uuid)
        try container.encode(firstname, forKey: .firstname)
        try container.encode(lastname, forKey: .lastname)
        try container.encode(birthday, forKey: .birthday)
        try container.encode(emails, forKey: .emails)
        try container.encode(attributes, forKey: .attributes)
        try container.encode(data, forKey: .data)
    }

    var id: String {
        get {
            return self.uuid.uuidString
        }
    }

    private enum CodingKeys: String, CodingKey {
        case uuid, username, firstname, lastname, birthday, emails, attributes, icon, data
    }
}
