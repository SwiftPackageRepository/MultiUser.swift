//
//  Phone.swift
//  
//
//  Created by Sascha Müllner on 11.03.20.
//

import Foundation

public struct Phone: Codable {

    public var label: String?
    public var phone: String?

    public init() {
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.label = try values.decodeIfPresent(String.self, forKey: .label)
        self.phone = try values.decodeIfPresent(String.self, forKey: .phone)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.label, forKey: .label)
        try container.encodeIfPresent(self.phone, forKey: .phone)
    }

    private enum CodingKeys: String, CodingKey {
        case label, phone
    }
}
