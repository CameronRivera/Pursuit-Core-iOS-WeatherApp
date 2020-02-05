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
    private var savedPhoto = StoragePhoto(photoData: Data())
    private var fileManagerHandler = FileManagerHelper<StoragePhoto>("Favourites.plist")
    private var photos = [PixPhoto](){
        didSet{
            detailedView.cityImageView.getImage(photos[Int.random(in: 0...photos.count - 1)].largeImageURL) { [weak self] result in
                switch result {
                case .failure(let netError):
                    DispatchQueue.main.async{
                        self?.showAlert("Error Loading Image", "Could not receive random image: \(netError)")
                    }
                case .success(let image):
                    DispatchQueue.main.async{
                        self?.detailedView.cityImageView.image = image
                    }
                }
            }
        }
    }
    public var dailyForecast: Weather?
    public var location = ""
    
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
        navigationItem.rightBarButtonItem?.target = self
        navigationItem.rightBarButtonItem?.action = #selector(photoFavourited)
    }
    
    private func setUpUI(){
        guard let forecast = dailyForecast else {
            fatalError("Failed to pass weather data during segue")
        }
        
        detailedView.cityAndForecastLabel.text = "The weather for \(location) on \(stringVar.intervalIntoDate(forecast.time))"
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
        
        PixAPI.getPixPhotos(PixAPI.getPixURL(location)) { [weak self] result in
            switch result{
            case .failure(let error):
                DispatchQueue.main.async{
                    self?.showAlert("Error loading Photos", "Could not successfully load photos: \(error)")
                }
            case .success(let pics):
                self?.photos = pics
            }
        }
    }
    
    @IBAction func photoFavourited(_ sender: UIBarButtonItem){
        if let favouriteData = detailedView.cityImageView.image?.jpegData(compressionQuality: 1.0){
            savedPhoto.photoData = favouriteData
            do {
                if try fileManagerHandler.contains(savedPhoto){
                    try fileManagerHandler.remove(savedPhoto)
                    showAlert("Removed", "Photo successfully removed from favourites.")
                } else {
                    try fileManagerHandler.saveObject(savedPhoto)
                    showAlert("Success", "Photo successfully added to favourites.")
                }
            } catch {
                showAlert("Error Saving Photo", "\(error)")
            }
        }
    }
}
