//
//  Region.swift
//  CapitalCities
//
//  Created by Rodrigo Cavalcanti on 06/06/24.
//

import UIKit

enum Region {
    case north, northeast, southeast, centralWest, south
}

extension Region {
    var color: UIColor {
        switch self {
        case .north:
            return .green
        case .northeast:
            return .blue
        case .southeast:
            return .orange
        case .centralWest:
            return .yellow
        case .south:
            return .red
        }
    }
}
