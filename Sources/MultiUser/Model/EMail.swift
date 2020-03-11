//
//  EMail.swift
//  
//
//  Created by Sascha Müllner on 11.03.20.
//

import Foundation

public struct EMail: Codable {

    public var label: String?
    public var email: String?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.label = try values.decodeIfPresent(String.self, forKey: .label)
        self.email = try values.decodeIfPresent(String.self, forKey: .email)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.label, forKey: .label)
        try container.encodeIfPresent(self.email, forKey: .email)
    }

    private enum CodingKeys: String, CodingKey {
        case label, email
    }
}
