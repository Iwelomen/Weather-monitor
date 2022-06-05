//
//  WeatherViewController.swift
//  Weather App
//
//  Created by Decagon on 4/2/22.
//

import UIKit

class WeatherViewController: UIViewController {
    
    //MARK: - Outlet for main, dynamic  Image view
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet var superView: UIView!
    
    
    
    //MARK: - Temperature outlets for Main day weather details
    @IBOutlet weak var currentDayMainTemperatureLabel: UILabel!
    
    @IBOutlet weak var temperatureDiscriptionLabel: UILabel!
    
    
    //MARK: - Outlet for current temperature
    @IBOutlet weak var currentDayMinimumTemperatureLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    
    @IBOutlet weak var currentDayMaximumTemperatureLabel: UILabel!
    
    
    //MARK: - Outlet for first day temperature
    
    @IBOutlet weak var firstDayTemperatureLabel: UILabel!
    
    @IBOutlet weak var secondDayTemperatureLabel: UILabel!
    
    @IBOutlet weak var thirdDayTemperatureLabel: UILabel!
    
    @IBOutlet weak var forthDayTemperatureLabel: UILabel!
    
    @IBOutlet weak var fifthDayTemperatureLabel: UILabel!
    
    //MARK: - Outlet for day names
    
    @IBOutlet weak var firstDayNameLabel: UILabel!
    
    @IBOutlet weak var secondDayNameLabel: UILabel!
    
    
    @IBOutlet weak var thirdDayNameLabel: UILabel!
    
    @IBOutlet weak var forthDayNameLabel: UILabel!
    
    @IBOutlet weak var fifthDayNameLabel: UILabel!
    
    
    //MARK: - Outlet for daily images
    
    
    @IBOutlet weak var firstDayImageview: UIImageView!
    
    @IBOutlet weak var secondDayImageView: UIImageView!
    
    @IBOutlet weak var thirdDayImageView: UIImageView!
    
    @IBOutlet weak var forthDayImageView: UIImageView!
    
    @IBOutlet weak var fifthDayImageView: UIImageView!
    
    
    private var viewModel = CurrentViewModel()
    var currentWeather: CurrentWeatherAPI?
    var fiveDayForecast: ForecastAPIServiceModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.dataDelegate = self
        viewModel.fetchCurrentData()
        viewModel.fetchForecastData()
    }
}


