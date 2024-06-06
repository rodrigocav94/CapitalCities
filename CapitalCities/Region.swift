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
            return .systemGreen
        case .northeast:
            return .systemBlue
        case .southeast:
            return .systemOrange
        case .centralWest:
            return .systemYellow
        case .south:
            return .systemRed
        }
    }
}
