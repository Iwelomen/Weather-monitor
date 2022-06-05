//
//  Styling.swift
//  Weather App
//
//  Created by Decagon on 4/6/22.
//

import Foundation
import UIKit

enum Styling {
    case rainy
    case cloudy
    case sunny
    case others
    
    //MARK: - Color styles
    var color: UIColor {
        switch self {
        case .rainy:
            return UIColor(red: 0.34, green: 0.34, blue: 0.36, alpha: 1)
        case .cloudy:
            return UIColor(red: 0.38, green: 0.52, blue: 0.58, alpha: 1)
        case .sunny:
            return UIColor(red: 0.29, green: 0.56, blue: 0.89, alpha: 1)
        case .others:
            return UIColor(red: 0.00, green: 0.00, blue: 0.00, alpha: 1)
        }
    }
    
    //MARK: - Images style 
    var weatherImage: UIImage {
        switch self {
        case .rainy:
            return UIImage(named: "forest_rainy")!
        case .cloudy:
            return UIImage(named: "forest_cloudy")!
        case .sunny:
            return UIImage(named: "forest_sunny")!
        case .others:
            return UIImage(named: "default")!
        }
    }
    
    
}
