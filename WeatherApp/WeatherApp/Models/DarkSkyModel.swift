//
//  DarkSkyModel.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 2/2/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

struct WeatherWrapper: Codable{
    var timezone: String
    var daily: WeeklyWeather
}

struct WeeklyWeather: Codable {
    var data: [Weather]
}

struct Weather: Codable {
    var time: Int
    var summary: String?
    var icon: String
    var sunriseTime: Int?
    var sunsetTime: Int?
    var precipProbability: Double
    var temperatureHigh: Double
    var temperatureLow: Double
    var windSpeed: Double
    
}
