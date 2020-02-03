//
//  DetailViewController.swift
//  WeatherApp
//
//  Created by Cameron Rivera on 1/31/20.
//  Copyright © 2020 David Rifkin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    private var detailedView = DetailedView()
    private var stringVar = ""
    public var dailyForecast: Weather?
    
    override func loadView() {
        view = detailedView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Detailed Forecast"
        setUp()
        setUpUI()
    }
    
    private func setUp() {
        navigationItem.rightBarButtonItem = detailedView.saveButton
    }
    
    private func setUpUI(){
        guard let forecast = dailyForecast else {
            fatalError("Failed to pass weather data during segue")
        }
        
        detailedView.cityAndForecastLabel.text = "Filler Text"
        detailedView.cityImageView.image = UIImage(systemName: "person")
        if let summary = forecast.summary{
            detailedView.descriptionLabel.text = summary
        } else {
            detailedView.descriptionLabel.text = "Data unavailable"
        }
        detailedView.highLabel.text = "High: \(String(format: "%0.0f", forecast.temperatureHigh))°F"
        detailedView.lowLabel.text = "Low: \(String(format: "%0.0f", forecast.temperatureLow))°F"
        
        if let sunrise = forecast.sunriseTime {
            detailedView.sunriseLabel.text = "Sunrise: \(stringVar.intervalIntoTime(sunrise))"
        } else {
            detailedView.sunriseLabel.text = "Data unavailable"
        }
        
        if let sunset = forecast.sunsetTime {
            detailedView.sunsetLabel.text = "Sunset: \(stringVar.intervalIntoTime(sunset))"
        } else {
            detailedView.sunsetLabel.text = "Data unavailable"
        }
        
        detailedView.windSpeedLabel.text = "Windspeed: \(forecast.windSpeed)"
        
        detailedView.precipitationLabel.text = "Chance of precipitation: \(String(format: "%0.0f",forecast.precipProbability * 100))%"
    }
}
