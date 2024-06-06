//
//  Capital.swift
//  CapitalCities
//
//  Created by Rodrigo Cavalcanti on 05/06/24.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation, Codable {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var region: Region
    var suffix: String
    
    init(title: String? = nil, coordinate: CLLocationCoordinate2D, info: String, region: Region, suffix: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        self.region = region
        self.suffix = suffix
    }
    
    // MARK: - Codable Conformity
    enum CodingKeys: String, CodingKey {
        case title
        case latitude
        case longitude
        case info
        case region
        case suffix
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        let latitude = try container.decode(Double.self, forKey: .latitude)
        let longitude = try container.decode(Double.self, forKey: .longitude)
        self.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        self.info = try container.decode(String.self, forKey: .info)
        self.region = try container.decode(Region.self, forKey: .region)
        self.suffix = try container.decode(String.self, forKey: .suffix)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(coordinate.latitude, forKey: .latitude)
        try container.encode(coordinate.longitude, forKey: .longitude)
        try container.encode(info, forKey: .info)
        try container.encode(region, forKey: .region)
        try container.encode(suffix, forKey: .suffix)
    }
}


extension Capital {
    static let all: [Capital] = {
        let capitalCitiesURL = Bundle.main.url(forResource: "CapitalCities", withExtension: "json")
        let decoder = JSONDecoder()
        
        guard let capitalCitiesURL,
              let data = try? Data(contentsOf: capitalCitiesURL),
              let capitalCities = try? decoder.decode([Capital].self, from: data) else { return [] }
        
        return capitalCities
    }()
}
