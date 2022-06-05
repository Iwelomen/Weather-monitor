//
//  ApiService.swift
//  Weather App
//
//  Created by Decagon on 4/3/22.
//
import UIKit
import Foundation

enum UserError: Error{
    case NoDataAvailable
    case cannotProcessData
    case InvaildURL
}

struct ApiService {
    
    static let sharedInstance = ApiService()
    
    let session = URLSession.shared
    let currentWeatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(API.location)&appid=\(API.apiKey)&units=metric")
    
    
    func getCurrentWeatherData(completion: @escaping(Result<CurrentWeatherAPI, UserError>) -> Void){
        guard let userURL = currentWeatherURL else{
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
                let user = try decoder.decode(CurrentWeatherAPI.self, from: data)
                completion(.success(user))
            }
            catch{
                completion(.failure(.cannotProcessData))
            }
        }
        dataTask.resume()
    }
    
    private init () {}
}
