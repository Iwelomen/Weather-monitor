//
//  FiveDayWeatherForecastModel.swift
//  Weather App
//
//  Created by Decagon on 4/6/22.
//

import Foundation

// MARK: - ForecastAPIService
struct ForecastAPIServiceModel: Codable {
    let list: [List]
}

// MARK: - List
struct List: Codable {
    let date: String
    let main: Main
    let weather: [Weather]
    
    enum CodingKeys: String, CodingKey{
        case date = "dt_txt"
        case main
        case weather
    }
}

// MARK: - Main
struct Main: Codable {
    let temp: Double
}

// MARK: - Weather
struct Weather: Codable {
    let main: String
}
