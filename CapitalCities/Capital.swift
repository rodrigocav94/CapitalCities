//
//  Capital.swift
//  CapitalCities
//
//  Created by Rodrigo Cavalcanti on 05/06/24.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var region: Region
    
    init(title: String? = nil, coordinate: CLLocationCoordinate2D, info: String, region: Region) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        self.region = region
    }
}
