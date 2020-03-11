//
//  Address.swift
//  
//
//  Created by Sascha Müllner on 11.03.20.
//

import Foundation
import CoreLocation

public struct Address : Codable {

    public var label: String?
    public var street: String?
    public var city: String?
    public var postcode: String?
    public var country: String?
    public var latitude: CLLocationDegrees?
    public var longitude: CLLocationDegrees?


    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.label = try values.decodeIfPresent(String.self, forKey: .label)
        self.street = try values.decodeIfPresent(String.self, forKey: .street)
        self.city = try values.decodeIfPresent(String.self, forKey: .city)
        self.postcode = try values.decodeIfPresent(String.self, forKey: .postcode)
        self.country = try values.decodeIfPresent(String.self, forKey: .country)
        self.latitude = try values.decodeIfPresent(CLLocationDegrees.self, forKey: .latitude)
        self.longitude = try values.decodeIfPresent(CLLocationDegrees.self, forKey: .longitude)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.label, forKey: .label)
        try container.encodeIfPresent(self.street, forKey: .street)
        try container.encodeIfPresent(self.city, forKey: .city)
        try container.encodeIfPresent(self.postcode, forKey: .postcode)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.latitude, forKey: .latitude)
        try container.encodeIfPresent(self.longitude, forKey: .longitude)
    }

    private enum CodingKeys: String, CodingKey {
        case label, street, city, postcode, country, latitude, longitude
    }
}
