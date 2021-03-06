//
//  User.swift
//
//
//  Created by Sascha Müllner on 29.02.20.
//

import Foundation
import CoreImage

public struct User: Codable {
    private var uuid: UUID

    public var username: String?
    public var firstname: String?
    public var lastname: String?
    public var birthday: Date?
    public var emails: [EMail] = [EMail]()
    public var phones: [Phone] = [Phone]()
    public var addresses: [Address] = [Address]()
    public var capabilities: Capabilities = Capabilities()
    public var attributes: [String: String] = [String: String]()
    public var icon: Data?
    public var data: [Data] = [Data]()

    public init() {
        self.uuid = UUID()
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.uuid = try values.decode(UUID.self, forKey: .uuid)
        self.username = try values.decodeIfPresent(String.self, forKey: .username)
        self.firstname = try values.decodeIfPresent(String.self, forKey: .firstname)
        self.lastname = try values.decodeIfPresent(String.self, forKey: .lastname)
        self.birthday = try values.decodeIfPresent(Date.self, forKey: .birthday)
        self.emails = try values.decodeIfPresent([EMail].self, forKey: .emails) ?? [EMail]()
        self.phones = try values.decodeIfPresent([Phone].self, forKey: .phones) ?? [Phone]()
        self.addresses = try values.decodeIfPresent([Address].self, forKey: .addresses) ?? [Address]()
        self.capabilities = try values.decodeIfPresent(Capabilities.self, forKey: .capabilities) ?? Capabilities()
        self.attributes = try values.decodeIfPresent([String: String].self, forKey: .attributes) ?? [String: String]()
        self.icon = try values.decodeIfPresent(Data.self, forKey: .icon)
        self.data = try values.decodeIfPresent([Data].self, forKey: .data) ?? [Data]()
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.uuid, forKey: .uuid)
        try container.encodeIfPresent(self.username, forKey: .username)
        try container.encodeIfPresent(self.firstname, forKey: .firstname)
        try container.encodeIfPresent(self.lastname, forKey: .lastname)
        try container.encodeIfPresent(self.birthday, forKey: .birthday)
        try container.encodeIfPresent(self.emails, forKey: .emails)
        try container.encodeIfPresent(self.phones, forKey: .phones)
        try container.encodeIfPresent(self.addresses, forKey: .addresses)
        try container.encodeIfPresent(self.capabilities, forKey: .capabilities)
        try container.encodeIfPresent(self.attributes, forKey: .attributes)
        try container.encodeIfPresent(self.icon, forKey: .icon)
        try container.encodeIfPresent(self.data, forKey: .data)
    }

    public var id: UUID {
        get {
            return self.uuid
        }
    }

    private enum CodingKeys: String, CodingKey {
        case uuid, username, firstname, lastname, birthday, emails, phones, addresses, capabilities, attributes, icon, data
    }
}
