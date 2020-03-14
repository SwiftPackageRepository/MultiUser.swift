//
//  Capabilities.swift
//  
//
//  Created by Sascha Müllner on 11.03.20.
//

import Foundation

public struct Capabilities: Codable {
    
    public var nativeLanguage: String?
    public var languages: [String]?

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.nativeLanguage = try values.decodeIfPresent(String.self, forKey: .nativeLanguage)
        self.languages = try values.decodeIfPresent([String].self, forKey: .languages) ?? [String]()
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.nativeLanguage, forKey: .nativeLanguage)
        try container.encodeIfPresent(self.languages, forKey: .languages)
    }

    private enum CodingKeys: String, CodingKey {
        case nativeLanguage, languages
    }
}
