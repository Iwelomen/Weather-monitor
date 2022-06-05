//
//  ForecastAPIService.swift
//  Weather App
//
//  Created by Decagon on 4/6/22.
//

import Foundation

// MARK: - Variables to get data from API
struct ForecastAPIService {
    
    static let sharedInstance = ForecastAPIService()
    
    let session = URLSession.shared
    let forecasttWeatherURL = URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=\(API.location)&appid=\(API.apiKey)&units=metric")
    
    
    //MARK: - Method to get forecast data from API
    
    func getForecastWeatherData(completion: @escaping(Result<ForecastAPIServiceModel, UserError>) -> Void) {
        
        guard let userURL = forecasttWeatherURL else{
            completion(.failure(.InvaildURL))
            return
        }
        
        let dataTask = session.dataTask(with: userURL){data, response, UserError in
            
            guard let data = data else {
                completion(.failure(.NoDataAvailable))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let user = try decoder.decode(ForecastAPIServiceModel.self, from: data)
                completion(.success(user))
                print(user)
            }
            catch{
                completion(.failure(.cannotProcessData))
            }
        }
        dataTask.resume()
    }
    private init () {}
}
