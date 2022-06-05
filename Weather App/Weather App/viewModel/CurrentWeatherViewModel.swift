//
//  CurrentWeatherViewModel.swift
//  Weather App
//
//  Created by Decagon on 4/6/22.
//

import Foundation
protocol DataDelegate: AnyObject {
    func fetchCurrentData(_ data: CurrentWeatherAPI)
    func fetchForecastData(_ data: ForecastAPIServiceModel)
}

class CurrentViewModel {
    
    weak var dataDelegate: DataDelegate? // weak var handles memory leaks
    
    let apiService: ApiService = ApiService.sharedInstance
    var weatherInfo: CurrentWeatherAPI?
    
    let forecastService: ForecastAPIService = ForecastAPIService.sharedInstance
    var forecastDetails: ForecastAPIServiceModel?
    
    func fetchCurrentData() {
        apiService.getCurrentWeatherData{ [weak self] result in
            switch result {
            case .success(let currentData):
                DispatchQueue.main.async {
                    self?.dataDelegate?.fetchCurrentData(currentData)
                }
            case .failure(let errors):
                print(errors)
                
            }
        }
    }
    
    func fetchForecastData() {
        forecastService.getForecastWeatherData { [weak self] result in
            switch result {
            case .success(let forecastData):
                DispatchQueue.main.async {
                    self?.dataDelegate?.fetchForecastData(forecastData)
                }
            case .failure(let errors):
                print(errors)
            }
        }
        
    }
    
    
}
