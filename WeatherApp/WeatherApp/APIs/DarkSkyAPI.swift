//
//  DarkSkyAPI.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 2/2/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import Foundation

struct DarkSkyAPI {
    
    static func getWeather(_ urlString: String, completion: @escaping (Result<WeatherWrapper,NetworkError>) -> ()) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.badURL(urlString)))
            return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(request) { result in
            switch result {
            case .failure(let netError):
                completion(.failure(.networkClientError(netError)))
            case .success(let data):
                do {
                    let weather = try JSONDecoder().decode(WeatherWrapper.self, from: data)
                    completion(.success(weather))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
    
    static func getWeatherURL(_ latAndLong: (Double, Double)) -> String{
        return "https://api.darksky.net/forecast/\(ApiKeys.darkSkyApiKey)/\(latAndLong.0),\(latAndLong.1)?exclude=minutely,hourly,alerts,flags"
    }
    
    static func areYouNumber(_ inputText: String) -> Bool{
        for char in inputText{
            if !char.isNumber{
                return false
            }
        }
        return true
    }
}
