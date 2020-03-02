//
//  UserIndex.swift
//  
//
//  Created by Sascha Müllner on 02.03.20.
//

import Foundation

public struct UserIndex : Codable {
    var currentUserUUID: UUID?

    public init() {
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.currentUserUUID = try values.decode(UUID.self, forKey: .currentUserUUID)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.currentUserUUID, forKey: .currentUserUUID)
    }

    private enum CodingKeys: String, CodingKey {
        case currentUserUUID
    }
}
