//
//  Extension+WeatherViewController.swift
//  Weather App
//
//  Created by Decagon on 4/6/22.
//

import UIKit

extension WeatherViewController: DataDelegate {
    
    // Date formatting
    private func covertDate(_ date: String?) -> String {
        var fixDate = ""
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        if let originalDate = date {
            if let newDate = dateFormatter.date(from: originalDate) {
                dateFormatter.dateFormat = "EEEE"
                fixDate = dateFormatter.string(from: newDate)
            }
        }
        return fixDate
    }
    
    
    
    func fetchCurrentData(_ data: CurrentWeatherAPI) {
        self.currentWeather = data
        self.currentDayMainTemperatureLabel.text = "\(Int((currentWeather?.main.temp) ?? 0))˚"
        self.currentDayMinimumTemperatureLabel.text = "\(Int(currentWeather?.main.tempMin ?? 0.0))"
        self.currentDayMaximumTemperatureLabel.text = "\(Int(currentWeather?.main.tempMax ?? 0.0))"
        self.currentTemperatureLabel.text = "\(Int(currentWeather?.main.temp ?? 0.0))"
        
        
        if (currentWeather?.weather[0].main == "Clouds") {
            self.temperatureDiscriptionLabel.text = "CLOUDY"
            mainImageView.image = Styling.cloudy.weatherImage
            view.backgroundColor = Styling.cloudy.color
        } else if (currentWeather?.weather[0].main == "Rain") {
            temperatureDiscriptionLabel.text = "RAINY"
            mainImageView.image = Styling.rainy.weatherImage
            view.backgroundColor = Styling.rainy.color
        } else if (currentWeather?.weather[0].main == "Clear") {
            temperatureDiscriptionLabel.text = "SUNNY"
            mainImageView.image = Styling.sunny.weatherImage
            view.backgroundColor = Styling.sunny.color
        }
        
    }
    
    func fetchForecastData(_ data: ForecastAPIServiceModel) {
        self.fiveDayForecast = data
        self.firstDayTemperatureLabel.text = "\(Int(fiveDayForecast?.list[0].main.temp ?? 0.0))"
        self.secondDayTemperatureLabel.text = "\(Int(fiveDayForecast?.list[8].main.temp ?? 0))"
        self.thirdDayTemperatureLabel.text = "\(Int(fiveDayForecast?.list[17].main.temp ?? 0))"
        self.forthDayTemperatureLabel.text = "\(Int(fiveDayForecast?.list[25].main.temp ?? 0))"
        self.fifthDayTemperatureLabel.text = "\(Int(fiveDayForecast?.list[37].main.temp ?? 0))"
        
        
        self.firstDayImageview.image = UIImage(named: "clear")
        self.secondDayImageView.image = UIImage(named: "rain")
        self.thirdDayImageView.image = UIImage(named: "partlysunny")
        self.forthDayImageView.image = UIImage(named: "clear")
        self.fifthDayImageView.image = UIImage(named: "rain")
        
        
        self.firstDayNameLabel.text = covertDate(fiveDayForecast?.list[0].date)
        self.secondDayNameLabel.text = covertDate(fiveDayForecast?.list[8].date)
        self.thirdDayNameLabel.text = covertDate(fiveDayForecast?.list[17].date)
        self.forthDayNameLabel.text = covertDate(fiveDayForecast?.list[25].date)
        self.fifthDayNameLabel.text = covertDate(fiveDayForecast?.list[37].date)
    }
}

